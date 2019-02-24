# Notes

Private note system and related management commands.

## Initial Setup

Run the setup script and provide the notes storage folder, like:

```
sudo sh setup.sh "~/Dropbox/Notes"
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
- Line 3: A tags line improve future discoverability, with items in the following format: "` #career #money #research `"
- Line 5: Markdown note content as required

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
