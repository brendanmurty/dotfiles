# Obsidian Backup Scripts

## Linux

*Tested on Ubuntu 24.04, may need some tweaks for other distributions.*

1. Copy over the script to your user directory: `cp backup-obsidian-notes.linux.sh ~/backup-obsidian-notes.sh`
2. Ensure the script is executable: `chmod +x ~/backup-obsidian-notes.sh`
3. Edit the `BACKUP_DIR` and `SOURCE_DIR` values to match your source and backup directories
4. Run the script: `~/backup-obsidian-notes.sh`
5. Check the resulting ZIP file contains your notes as expected

### Setup Scheduled Runs

*Optionally*, you can also setup scheduled backups via `crontab`.

Consult [crontab guru](https://crontab.guru/) to generate the cron schedule expression to suit your needs.

Open your user's cron list by running `crontab -e`.

Then add a new line at the end starting with your `cron schedule expression`, then a space, then the full path to your script.

Example line to run every day at 2am and your user directory name is `example`:

```
0 2 * * * /home/example/backup-obsidian-notes.sh
```

You could also add an extra line below that to also run it after rebooting:

```
@reboot /home/example/backup-obsidian-notes.sh
```

### Troubleshooting

The `zip` command may fail if some filenames in `$SOURCE_DIR` include non standard characters.

Assuming your source notes directory is `~/Notes`, this can be fixed with:

```bash
sudo apt install rename
cp -r ~/Notes ~/Notes_backup-before-rename
rename -n 's/[^\x00-\x7F]//g' ~/Notes/*
```

## Windows

1. Copy over `backup-obsidian-notes.windows.sh` to your user directory
2. Install [Git Bash for Windows](https://git-scm.com/downloads)
3. Install [7-Zip](https://www.7-zip.org/), use the default install location
4. Edit the paths in the script to match your source and backup directories
