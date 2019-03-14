<?php

// Your Application Key
//   - Generate this by visiting https://trello.com/1/appKey/generate
$application_key = 'your_app_key';

// Your Application Token
//   - Configure $application_key first, then run trello-backup.php to obtain this
$application_token = 'your_app_token';

// Backup closed boards?
$backup_closed_boards = false;

// Backup all boards from organisations that you have read access to?
$backup_all_organisation_boards = false;

// Backup all card attachments?
$backup_attachments = true;

// Location to store the backup files
$backup_path = dirname(__FILE__);

// Backup each board and it's attachments as a single ZIP file instead of a folder?
$backup_as_zip = false;

// Location to store the backup files temporarily before they're saved as ZIP files
$backup_temp_path = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'temp';

// HTTP proxy, if one is required, in the format 'host:port'
$proxy = '';

// Array of boards to ignore regardless of other settings
$ignore_boards = array('Welcome Board');

// Timezone to use for the script - http://php.net/manual/en/timezones.php
$timezone = 'Australia/Sydney';

// Show progress messages when the script runs? Only major error messages will be shown if this is set to false
$show_msgs = true;
