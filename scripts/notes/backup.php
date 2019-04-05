<?php

// backup.php - Create a ZIP file containing all file in all notes subdirectories

include('vendor/autoload.php');

ini_set('memory_limit', '512M');

// Load environment variables from the ".env" file in this folder
$dotenv = Dotenv\Dotenv::create(__DIR__);
$dotenv->load();

// Get the current date
$date = date('Ymd');

// Default to using this directory as the main notes storage directory
$notes_content_directory = __DIR__;

// If it's provided in the first parameter passed to this script, use this directory as the base content directory.
// Otherwise attempt to load it from the related environment variable
if (!empty($argv[1])) {
    $notes_content_directory = $argv[1];
} elseif (getenv('NOTES_STORAGE_FOLDER')) {
    $notes_content_directory = getenv('NOTES_STORAGE_FOLDER');
}

// Set a default Backup directory
$notes_backup_directory = $notes_content_directory . '_Backups';

// Attempt to load the Backup directory from the related environment variable
if (getenv('NOTES_BACKUP_FOLDER')) {
    $notes_backup_directory = getenv('NOTES_BACKUP_FOLDER');
}

// Make the Backup directory if required
if (!file_exists($notes_backup_directory)) {
    mkdir($notes_backup_directory, '0777', true);
}

$backup_file_path = $notes_backup_directory . DIRECTORY_SEPARATOR . 'notes_' . $date . '.zip';

echo 'INFO: Saving notes from "' . $notes_content_directory . '" to "' . $backup_file_path . '"...' . PHP_EOL;

// Create the backup file as a ZIP archive
$zip_created = createZip($notes_content_directory, $backup_file_path);

if ($zip_created) {
    echo 'DONE: Backup saved.' . PHP_EOL;
} else {
    echo 'ERROR: Backup failed!' . PHP_EOL;
}

// createZip - Create a new ZIP file containing all files in a certain directory, originally sourced from https://stackoverflow.com/a/41959747
function createZip($source, $destination) {
    if (!extension_loaded('zip') || !file_exists($source)) {
        return false;
    }

    $zip = new ZipArchive();
    if (!$zip->open($destination, ZIPARCHIVE::CREATE | ZIPARCHIVE::OVERWRITE)) {
        return false;
    }

    $source = str_replace('\\', DIRECTORY_SEPARATOR, realpath($source));

    if (is_dir($source) === true) {
        $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($source), RecursiveIteratorIterator::SELF_FIRST);

        foreach ($files as $file) {
            $file = str_replace('\\', DIRECTORY_SEPARATOR, $file);

            // Ignore some folders and files
            if (
                in_array(substr($file, strrpos($file, DIRECTORY_SEPARATOR) + 1), array('.', '..')) ||
                strrpos($file, DIRECTORY_SEPARATOR . '_Backups') > -1 ||
                strrpos($file, DIRECTORY_SEPARATOR . '_Backups' . DIRECTORY_SEPARATOR) > -1
            ) {
                continue;
            }

            $file = realpath($file);

            if (is_dir($file) === true) {
                $zip->addEmptyDir(str_replace($source . DIRECTORY_SEPARATOR, '', $file . DIRECTORY_SEPARATOR));
            } elseif (is_file($file) === true) {
                $zip->addFromString(str_replace($source . DIRECTORY_SEPARATOR, '', $file), file_get_contents($file));
            }
        }
    } elseif (is_file($source) === true) {
        $zip->addFromString(basename($source), file_get_contents($source));
    }

    return $zip->close();
}
