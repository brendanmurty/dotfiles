<?php

// backup.php - Create a ZIP file containing all notes subfolders

$notes_content_folder = __DIR__;
if (!empty($argv[1])) {
    $notes_content_folder = $argv[1];
}

$date = date('Ymd');
$backup_file_path = $notes_content_folder . DIRECTORY_SEPARATOR . '_Backups' . DIRECTORY_SEPARATOR . 'notes_' . $date . '.zip';

$zip_created = createZip($notes_content_folder, $backup_file_path);

if ($zip_created) {
    echo 'DONE: Backup saved to ' . $backup_file_path . PHP_EOL;
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
