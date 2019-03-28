<?php

/*
New Note
----

Creates a new Markdown file in the Inbox folder using the current date as the filename.

The first optional parameter is the top level notes storage folder:

    php /path/to/this/file/new.php "/path/to/notes"

The second optional parameter to to use a template (md file) to set the initial content of the new note:

    php /path/to/this/file/new.php "/path/to/notes" "meeting"

Template files:

- Must be placed in a "_Templates" subdirectory
- Must have a lowercase filename with the "md" file extension
- Must contain plain-text markdown content only
- The date string can be dynamically inserted by adding !date! in the content of the file

*/

$date = new DateTime('now', new DateTimezone('Australia/Sydney'));
$date_full = $date->format('Ymd-Hisu');
$date_ymd = $date->format('Ymd');

$notes_content_directory = __DIR__;

if (!empty($argv[1])) {
    $notes_content_directory = $argv[1];
}

$notes_inbox_directory = $notes_content_directory . DIRECTORY_SEPARATOR . '_Inbox';
$notes_templates_directory = $notes_content_directory . DIRECTORY_SEPARATOR . '_Templates';

$note_template_content = '# !date!' . PHP_EOL . PHP_EOL . '` # `' . PHP_EOL . PHP_EOL . PHP_EOL;

if (!empty($argv[2])) {
    $note_template_file = $notes_templates_directory . DIRECTORY_SEPARATOR . strtolower($argv[2]) . '.md';

    if (file_exists($note_template_file)) {
        $note_template_content = file_get_contents($note_template_file);
    }
}

$note_template_content = str_ireplace('!date!', $date_ymd, $note_template_content);

$new_file_path = $notes_inbox_directory . DIRECTORY_SEPARATOR . $date_full . '.md';

$file = fopen($new_file_path, 'a+');
fwrite($file, $note_template_content);
fclose($file);

echo 'DONE: Note created at ' . $new_file_path . PHP_EOL;
