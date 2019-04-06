# Notes

Private note system and related management commands.

## Initial Setup

### 1. Create a ENV file based on [example.env](example.env)

```
cp example.env .env
```

### 2. Edit *.env*

1. Set your notes storage folder, which could be in a synced folder, for example
2. Set your notes scripts folder, which is the location of this file on your file system

### 3. Install the dependencies

1. PHP 7.3
2. PHP 7.3 Extension: mbstring
3. PHP 7.3 Extension: zip
4. [Composer](https://getcomposer.org/download/)
5. Run `composer install` in this directory

#### Ubuntu

```
apt-get update
apt-get -y install php7.3 php7.3-cli php7.3-mbstring php7.3-zip
composer install
```

### 4. Setup command aliases

Replace `NOTES_SCRIPTS_FOLDER` and `NOTES_STORAGE_FOLDER` in the commands below with the directories you set in step 2 above.

```
cp ~/.bash_aliases ~/.bash_aliases.bak

echo "# Notes shortcuts related to files in 'NOTES_STORAGE_FOLDER'" >> ~/.bash_aliases
echo "alias notebackup='php \"NOTES_SCRIPTS_FOLDER/backup.php\" \"NOTES_STORAGE_FOLDER\"'" >> ~/.bash_aliases
echo "alias notenew='php \"NOTES_SCRIPTS_FOLDER/new.php\" \"NOTES_STORAGE_FOLDER\"'" >> ~/.bash_aliases
echo "function notesearch() { grep --include=*.md --exclude=readme.md --exclude-dir=_Backups --color -rni \$1 \"NOTES_STORAGE_FOLDER\"; }" >> ~/.bash_aliases

. ~/.bash_aliases
```

## Notes Storage Directories

A subfolder is a high-level grouping of notes. Each folder has some rules:

- _Backups: Used by [backup.php](backup.php) as the default directory to store ZIP backups of the notes folders
- _Inbox: Unsorted notes, used as the default directory by [new.php](new.php)
- _Templates: Note template files, used as the default directory by [new.php](new.php)

You can create other folders here as needed, such as `Personal` or `Work`.

### Templates

- Must be placed in the `Templates` directory - configured via the `NOTES_TEMPLATE_FOLDER` variable in `.env` or defaulting to `_Templates` under the main Notes Storage Directory
- Must have a lowercase filename with the "md" file extension
- Must contain plain-text Markdown content only
- The current date can be dynamically inserted by adding !date! in the content of the file

## Commands

### Create a new note

```
notenew
```

### Create a new note using the "meeting" template

```
notenew "meeting"
```

### Search notes for "meeting"

```
notesearch "meeting"
```

### Backup notes

```
notebackup
```

## Formatting

### Files

A Markdown file in a subfolder usually has the following rules:

- Filename: Short, lowercase, snake case, usually starting with the date in `YYYYMMDD` format, such as `20190114_testing_item.md`
- Filename: In the case of ongoing, general note files, using a short descriptive name is suitable, such as `career_log.md`
- Line 1: A h1 describing the note, such as `# Meeting with xxx - 14 Jan 2019`
- Line 2: An empty line
- Line 3: A tags line to improve discoverability, with items in the following format: `` #family #home ``
- Line 4: An empty line
- Line 5+: Note content in Markdown format

#### Example

```
_Inbox/20190114_testing_note.md
----

# Meeting with xxx - 14 Jan 2019

` #example #testing `

The note's content goes here in *Markdown* [format](https://daringfireball.net/projects/markdown/syntax).
```
