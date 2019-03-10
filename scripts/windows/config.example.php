<?php 

$directories_to_backup = [
    ['C:\Users\Example', 'D:\Backups\Example', 'backup_example.log'],
    ['F:\Games', 'D:\Backups\Games', 'backup_games.log']
];

$exclude_directories = [
    'AppData',
    'Tracing',
    'node_modules'
];

$exclude_files = [
    'NTUSER',
    'NTUSER*'
];
