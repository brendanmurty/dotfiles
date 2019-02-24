<?php

// new.php - Create a Markdown file using the current date as a filename and heading

$notes_content_folder = __DIR__;
if (!empty($argv[1])) {
    $notes_content_folder = $argv[1];
}

$notes_inbox_folder = $notes_content_folder . DIRECTORY_SEPARATOR . '_Inbox';

$date = date('Ymd');

$new_file_path = $notes_inbox_folder . DIRECTORY_SEPARATOR . $date . '.md';

$file = fopen($new_file_path, "a+");
fwrite($file, '# ' . $date . PHP_EOL . PHP_EOL . '` # `' . PHP_EOL . PHP_EOL . PHP_EOL);
fclose($file);

echo 'Created a new Markdown file: ' . $new_file_path . PHP_EOL;
