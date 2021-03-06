# Trello Backup

This is a small PHP script that will backup all of your [Trello](https://trello.com/) boards and cards. It uses the Trello API to securely copy your board data and download it to your computer.

## Requirements

PHP 7.4 is required to run this script, please see the [PHP Installation Documentation](http://php.net/manual/en/install.php) for instructions on how to install it on your system.

If you'd like to use the optional Backup as ZIP file feature on a Linux machine, you need to also install the ZIP extension for PHP:

`sudo apt-get install php7.4-zip`

## Setup

1. Copy `config.example.php` file to `config.php` and make changes as needed - you can also use `config.windows.php`, `config.linux.php` and `config.mac.php` for settings specific to an Operating System
2. Visit [trello.com/1/appKey/generate](https://trello.com/1/appKey/generate)
3. Add the key to the `$application_key` variable in `config.php`
4. Run the script: `php trello-backup/trello-backup.php`
5. Add the token to the `$application_token` variable in `config.php`

## Usage

After completing the setup process, the script can be run normally and without interaction:

```
php trello-backup.php
```

You could also configure this to run automatically via your operating system's task scheduling system.

## Credits

The [original code](https://github.com/mattab/trello-backup) was built by Matthieu Aubry.
