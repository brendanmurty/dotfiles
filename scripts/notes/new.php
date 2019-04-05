<?php

/*
New Note
----

Creates a new Markdown file in the Inbox folder using the current date as the filename.

The first optional parameter is the top level notes storage folder:

    php "/path/to/this/file/new.php" "/path/to/notes"

The second optional parameter to to use a template (md file) to set the initial content of the new note:

    php "/path/to/this/file/new.php" "/path/to/notes" "meeting"

Template files:

- Must be placed in the "_Templates" subdirectory
- Must have a lowercase filename with the "md" file extension
- Must contain plain-text Markdown content only
- The current date can be dynamically inserted by adding !date! placeholder in the content of the file

*/

include('vendor/autoload.php');

// Get the current date and store it in a few different formats
$date = new DateTime('now', new DateTimezone('Australia/Sydney'));
$date_full = $date->format('Ymd-Hisu');
$date_ymd = $date->format('Ymd');

// Load environment variables from the ".env" file in this folder
$dotenv = Dotenv\Dotenv::create(__DIR__);
$dotenv->load();

// Default to using this directory as the main notes storage directory
$notes_content_directory = __DIR__;

// If it's provided in the first parameter passed to this script, use this directory as the base content directory, otherwise attempt to load it from the related environment variable
if (!empty($argv[1])) {
    $notes_content_directory = $argv[1];
} elseif (getenv('NOTES_STORAGE_FOLDER')) {
    $notes_content_directory = getenv('NOTES_STORAGE_FOLDER');
}

// Set some suitable defaults for the Inbox and Templates directories
$notes_inbox_directory = $notes_content_directory . DIRECTORY_SEPARATOR . '_Inbox';
$notes_templates_directory = $notes_content_directory . DIRECTORY_SEPARATOR . '_Templates';

// Update the Inbox folder if needed
if (getenv('NOTES_INBOX_FOLDER')) {
    $notes_inbox_directory = getenv('NOTES_INBOX_FOLDER');
}

// Update the Templates folder if needed
if (getenv('NOTES_TEMPLATE_FOLDER')) {
    $notes_templates_directory = getenv('NOTES_TEMPLATE_FOLDER');
}

// Make the notes directories if required
if (!file_exists($notes_inbox_directory)) {
    mkdir($notes_inbox_directory, '0777', true);
}
if (!file_exists($notes_templates_directory)) {
    mkdir($notes_templates_directory, '0777', true);
}

// Default to basic note content
$note_template_content = '# !date!' . PHP_EOL . PHP_EOL . '` # `' . PHP_EOL . PHP_EOL . PHP_EOL;

// If it's provided in the second parameter passed to this script, load the requested note template file
if (!empty($argv[2])) {
    $note_template_file = $notes_templates_directory . DIRECTORY_SEPARATOR . strtolower($argv[2]) . '.md';

    if (file_exists($note_template_file)) {
        $note_template_content = file_get_contents($note_template_file);
    }
}

// Replace the date placeholder with the current date
$note_template_content = str_ireplace('!date!', $date_ymd, $note_template_content);

// Save the note file
$new_file_path = $notes_inbox_directory . DIRECTORY_SEPARATOR . $date_full . '.md';
$file = fopen($new_file_path, 'a+');
fwrite($file, $note_template_content);
fclose($file);

echo 'DONE: Note created at ' . $new_file_path . PHP_EOL;
