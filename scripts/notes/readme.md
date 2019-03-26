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

- PHP 7.3
- PHP 7.3 Extension: mbstring
- PHP 7.3 Extension: zip

#### Ubuntu

```
apt-get update
apt-get -y install php7.3 php7.3-cli php7.3-mbstring php7.3-zip
```

### 4. Run the [setup script](setup.sh)

```
sudo sh setup.sh
```

## Commands

### Create a new note

```
notenew
```

### Search notes for "testing"

```
notesearch "testing"
```

### Backup notes

```
notebackup
```

## Formatting

### Files

A Markdown file in a subfolder should include:

- Filename: Short, lowercase, snake case, usually starting with the date in *YYYYMMDD* format, such as "20190114_testing_item.md"
- Filename: In the case of ongoing, general note files, using a short descriptive name is suitable, such as "career_log.md"
- Line 1: A h1 describing the note, such as "# Meeting with xxx - 14 Jan 2019"
- Line 2: An empty line
- Line 3: A tags line to improve discoverability, with items in the following format: "` #family #home `"
- Line 4: An empty line
- Line 5+: Markdown formatted note content

#### Example

```
_Inbox/20190114_testing_note.md
----

# Meeting with xxx - 14 Jan 2019

` #example #testing `

The note's content goes here in *Markdown* [format](https://daringfireball.net/projects/markdown/syntax).
```

### Subfolders

A subfolder is a high-level grouping of notes. Each folder has some rules:

- _Backups: Used by `backup.php` to store ZIP backups of the notes folders
- _Inbox: Unsorted notes, used by `new.php`
- Personal: Personal, home or family notes
- Work: Career or work related notes
