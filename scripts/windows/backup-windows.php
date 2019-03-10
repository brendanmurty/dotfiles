<?php

/*

Backup a Folder
----

Assumes that this is a Windows 10 machine with Robocopy already installed.
Assumes that this script is being run via Windows Command Prompt as the Administrator user.

More information at https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy

1. Deletes all existing files and folders in $destination
2. Copies all files and folders in $source to $destination, with some exceptions

*/

if (!file_exists(__DIR__ . DIRECTORY_SEPARATOR . 'config.php')) {
    echo 'ERROR: Config file ("config.php") not found, please create this from "config.example.php"' . PHP_EOL;
    exit();
}

require_once 'config.php';

if (!isset($directories_to_backup) || !is_array($directories_to_backup)) {
    echo 'ERROR: The backup configuration variable ("' . $directories_to_backup . '") isn\'t set or isn\'t an array' . PHP_EOL;
    exit();
}

foreach ($directories_to_backup as $backup) {
    $source = $backup[0];
    $destination = $backup[1];
    $log_file = $backup[2];

    if (!$source || !file_exists($source)) {
        echo 'ERROR: Source folder ("' . $source . '") not found' . PHP_EOL;
        exit;
    }

    if (!$destination || !file_exists($destination)) {
        echo 'ERROR: Destination folder ("' . $destination . '") not found' . PHP_EOL;
        exit;
    }

    echo 'INFO: Backing up ' . $source . ' to ' . $destination . '... ' . PHP_EOL;

    $exclude_directories_list = isset($exclude_directories) ? ' /XD "' . implode('" "', $exclude_directories) . '" ' : '';
    $exclude_files_list = isset($exclude_files) ? ' /XF "' . implode('" "', $exclude_files) . '" ' : '';

    shell_exec('robocopy "' . $source . '" "' . $destination . '" /MIR /COPY:DT /DCOPY:DT ' . $exclude_directories_list . ' ' . $exclude_files_list . ' /LOG:"' . $log_file . '"');

    echo 'INFO: Backup completed.' . PHP_EOL;
}
