<?php

// Backup a user's Trello boards, cards, checklists, comments and attachments to a local directory.

// Find the right configuration file to use for this system
$operating_system = strtolower(substr(PHP_OS, 0, 3));
$config_file = 'config.php';
if ($operating_system == 'win') {
    $config_file = 'config.windows.php';
} elseif ($operating_system == 'lin' || $operating_system == 'fre' || $operating_system == 'uni') {
    $config_file = 'config.linux.php';
} elseif ($operating_system == 'mac' || $operating_system == 'dar') {
    $config_file = 'config.mac.php';
}

// Check the configuration file exists
if (!file_exists(__DIR__ . DIRECTORY_SEPARATOR . $config_file)) {
    msg('error', 'Config file (' . $config_file . ') not found, please re-create this from "config.example.php"');
}

require_once $config_file;

// Set the timezone, defaulting to Sydney
date_default_timezone_set($timezone ? $timezone : 'Australia/Sydney');

// Default to displaying all progress messages
if (!isset($show_msgs)) {
    $show_msgs = true;
}

// Prompt the user enter a valid Application Token
if (strlen($application_token) < 30) {
    msg('error', 'Please visit this link to allow access your Trello account, then save this to the "$application_key" variable in the config file - https://trello.com/1/authorize?key=' . $application_key . '&name=Trello+Backup+Script&expiration=never&response_type=token');
}

// Configure proxy if required
$ctx = null;
if (!empty($proxy)) {
    $aContext = array(
        'http' => array(
            'proxy' => 'tcp://' . $proxy,
            'request_fullurl' => true
        )
    );

    $ctx = stream_context_create($aContext);
}

// Fetch all boards
$application_token = trim($application_token);
$url_boards = 'https://api.trello.com/1/members/me/boards?&key=' . $application_key . '&token=' . $application_token;
$response = file_get_contents($url_boards, false, $ctx);
if ($response === FALSE) {
    msg('error', 'Could not access the Trello API', $show_msgs);
}

$boardsInfo = json_decode($response);
if (empty($boardsInfo)) {
    msg('error', 'Could not access your boards, please verify your API tokens', $show_msgs);
}

// Fetch all organisations
$url_organisations = 'https://api.trello.com/1/members/me/organizations?&key=' . $application_key . '&token=' . $application_token;
$response = file_get_contents($url_organisations, false, $ctx);
$organisationsInfo = json_decode($response);
$organisations = array();
foreach ($organisationsInfo as $org) {
    $organisations[$org->id] = $org->displayName;
}

// Fetch all boards from the organisations that the user has read access to
if ($backup_all_organisation_boards) {
    foreach ($organisations as $organisation_id => $organisation_name) {
        $url_boards = 'https://api.trello.com/1/organizations/' . $organisation_id . '/boards?&key=' . $application_key . '&token=' . $application_token;
        $response = file_get_contents($url_boards, false, $ctx);
        $organisationBoardsInfo = json_decode($response);
        if (empty($organisationBoardsInfo)) {
            msg('error', 'Could not acess boards for "' . $organisation_name . '", please verify your API tokens', $show_msgs);
        } else {
            $boardsInfo = array_merge($organisationBoardsInfo, $boardsInfo);
        }
    }
}

// Only backup open boards
$boards = array();
foreach ($boardsInfo as $board) {
    if (!$backup_closed_boards && $board->closed) {
        continue;
    }

    if (isset($ignore_boards) && in_array($board->name, $ignore_boards)) {
        continue;
    }

    $boards[$board->id] = (object)array(
        'name' => $board->name,
        'orgName' => (isset($organisations[$board->idOrganization]) ? $organisations[$board->idOrganization] : ''),
        'closed' => (($board->closed) ? true : false)
    );
}

msg('info', 'Found ' . count($boards) . ' boards to backup', $show_msgs);

// Backup the board data
foreach ($boards as $id => $board) {
    $url_individual_board_json = 'https://api.trello.com/1/boards/' . $id . '?actions=all&actions_limit=1000&card_attachment_fields=all&cards=all&lists=all&members=all&member_fields=all&card_attachment_fields=all&checklists=all&fields=all&key=' . $application_key . '&token=' . $application_token;

    if ($backup_as_zip) {
        $dirname = getPathToStoreBackups($backup_temp_path, $board);
        $zip_path = getPathToStoreBackups($backup_path, $board) . '.zip';
    } else {
        $dirname = getPathToStoreBackups($backup_path, $board);
        $zip_path = false;
    }

    // Create the backup folders if they don't exist

    if (!file_exists($backup_temp_path)) {
        mkdir($backup_temp_path, 0777, true);
    }

    if (!file_exists($backup_path)) {
        mkdir($backup_path, 0777, true);
    }

    if (!file_exists($dirname)) {
        mkdir($dirname, 0777, true);
    }

    $filename = $dirname . DIRECTORY_SEPARATOR . sanitiseFileName($board->name) . '.json';

    msg(
        'info',
        'Saving ' . 
        (($board->closed) ? 'the closed ' : '') . 'board "' . $board->name . '"' . 
        (empty($board->orgName) ? '' : ' (within the "' . $board->orgName . '" organisation)') . 
        ' - "' . $filename . '"',
        $show_msgs
    );

    $response = file_get_contents($url_individual_board_json, false, $ctx);

    $decoded = json_decode($response);
    if (empty($decoded)) {
        msg('error', 'The board "' . $board->name . '" or organisation "' . $board->orgName . '" could not be downloaded', $show_msgs);
    }

    // Save the human friendly JSON to the backup location
    file_put_contents($filename, json_encode($decoded, JSON_PRETTY_PRINT));

    // Backup file attachments on cards in the board
    if ($backup_attachments) {
        $trelloObject = json_decode($response);
        $attachments = array();

        msg('info', 'Saving file attachments and shortcuts', $show_msgs);

        foreach ($trelloObject->actions as $member) {
            if (isset($member->data->attachment) && isset($member->data->attachment->url)) {
                $attachment = $member->data->attachment;

                if (array_key_exists('previewUrl2x', $attachment)) {
                    // A preview exists, download and save this attachment
                    $filename = strtolower($attachment->name);
                    $pathForAttachment = $dirname . DIRECTORY_SEPARATOR . $filename;
                    file_put_contents($pathForAttachment, file_get_contents($attachment->previewUrl2x));
                } else {
                    // A preview doesn't exist, so save this attachment as an Internet Shortcut instead
                    $filename = sanitiseFileName($attachment->name);
                    $pathForAttachment = $dirname . DIRECTORY_SEPARATOR . $filename . '.url';
                    file_put_contents($pathForAttachment, '[InternetShortcut]' . "\r\n" . 'URL=' . $attachment->url . "\r\n");
                }
            }
        }
    }
    
    if ($backup_as_zip) {
        $zip_created = createZip($dirname, $zip_path, $show_msgs);
        
        if ($zip_created) {
            deleteTempFolder($dirname, $backup_temp_path, $show_msgs);
        }
    }
}

msg('info', 'Finished!', $show_msgs);

// Construct a directory path
function getPathToStoreBackups($path, $board)
{
    return $path . DIRECTORY_SEPARATOR
        . 'trello-'
        . (!empty($board->orgName) ? sanitiseFileName($board->orgName) . '-': '')
        . sanitiseFileName($board->name)
        . (($board->closed) ? '-closed' : '')
        . '_' . date('Ymd');
}

// Construct a simplified filename
function sanitiseFileName($filename)
{
    return strtolower(
        str_replace(
            array('--', '---'),
            '',
            preg_replace(
                '/[^-\w]/',
                '',
                str_replace(
                    array('https', 'http', 'ftp', '//', '/', '\\', '.', '_', '+', '#', ',', ' '),
                    array('', '', '', '', '-', '-', '-', '-', '-', '-', '-', '-'),
                    $filename
                )
            )
        )
    );
}

// Create a new ZIP file containing all files in a certain directory
function createZip($contents_directory, $zip_file_path, $show_msgs) {
    $zip = new \ZipArchive();
    $handle = $zip->open($zip_file_path, \ZipArchive::CREATE | \ZipArchive::OVERWRITE);

    if ($handle !== true) {
        msg('error', 'Zip file could not be created - ' . $zip_file_path, $show_msgs);

        return false;
    } else {
        $files = glob($contents_directory . DIRECTORY_SEPARATOR . '{,.}*', GLOB_BRACE);
        
        foreach ($files as $file) {
            if (
                $file != $contents_directory . DIRECTORY_SEPARATOR . '.' &&
                $file != $contents_directory . DIRECTORY_SEPARATOR . '..'
            ) {
                $zip->addFromString(
                    str_replace($contents_directory . DIRECTORY_SEPARATOR, '', $file),
                    file_get_contents($file)
                );
            }
        }

        $zip->close();

        msg('info', 'Zip file created - "' . $zip_file_path . '"', $show_msgs);

        return true;
    }
}

// Delete an entire directory and it's contents
function deleteTempFolder($directory_path, $backup_temp_path, $show_msgs) {
    if (
        !empty($directory_path) &&
        is_dir($directory_path) &&
        strpos($directory_path, $backup_temp_path) !== false
    ) {
        // This folder is inside the backup folder, continue
        $files = glob($directory_path . DIRECTORY_SEPARATOR . '{,.}*', GLOB_BRACE);
        
        foreach ($files as $file) {
            if (
                $file != $directory_path . DIRECTORY_SEPARATOR . '.' &&
                $file != $directory_path . DIRECTORY_SEPARATOR . '..'
            ) {
                // This is an actual file or folder, delete
                unlink($file);
            }
        }

        rmdir($directory_path);

        msg('info', 'Deleted temporary folder "' . $directory_path . '"', $show_msgs);
    }
}

// Show an informational message in the output
function msg($message_type = 'info', $message_content = '', $enable_info_messages = true) {
    $message = strtoupper($message_type) . ': ' . $message_content . PHP_EOL;

    if ($message_type == 'error') {
        echo $message;
        exit;
    }

    if ($enable_info_messages) {
        echo $message;
    }
}
