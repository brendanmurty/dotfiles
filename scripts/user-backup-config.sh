#!/usr/bin/env bash
#
# Backup a linux User's main config files
#

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

LOG_FILE="$SCRIPT_DIR/user-backup-config.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch $LOG_FILE

cp -n "$SCRIPT_DIR/user-backup-config.sample.env" "$SCRIPT_DIR/user-backup-config.env"
source "$SCRIPT_DIR/user-backup-config.env"

BACKUP_FMT="+%Y%m%d"
BACKUP_DIR="$BACKUP_DIR/"$(date "$BACKUP_FMT")

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_DIR'..." >> $LOG_FILE

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> $LOG_FILE
  exit 1
fi

rm -rf "$BACKUP_DIR"

mkdir -p "$BACKUP_DIR"
mkdir -p "$BACKUP_DIR/.config"
mkdir -p "$BACKUP_DIR/.local"
mkdir -p "$BACKUP_DIR/.local/share/gnome-shell/extensions"
mkdir -p "$BACKUP_DIR/.local/share/applications"
mkdir -p "$BACKUP_DIR/.local/share/fonts"

cp "$SOURCE_DIR/.bash"* "$BACKUP_DIR"
cp "$SOURCE_DIR/.profile" "$BACKUP_DIR"
cp "$SOURCE_DIR/.git"* "$BACKUP_DIR"
cp "$SOURCE_DIR/.face"* "$BACKUP_DIR"

cp -r "$SOURCE_DIR/.config/autostart" "$BACKUP_DIR/.config/autostart"
cp -r "$SOURCE_DIR/.config/systemd" "$BACKUP_DIR/.config/systemd"
cp -r "$SOURCE_DIR/.config/zed" "$BACKUP_DIR/.config/zed"
cp -r "$SOURCE_DIR/.local/bin" "$BACKUP_DIR/.local/bin"
cp -r "$SOURCE_DIR/.local/share/gnome-shell/extensions" "$BACKUP_DIR/.local/share/gnome-shell/extensions"
cp -r "$SOURCE_DIR/.local/share/applications" "$BACKUP_DIR/.local/share/applications"
cp -r "$SOURCE_DIR/.local/share/fonts" "$BACKUP_DIR/.local/share/fonts"

if command -v crontab >/dev/null 2>&1 ; then
  echo $(sudo crontab -l -u "$SOURCE_USER_NAME") > "$BACKUP_DIR/crontab.txt"
fi

ls -lah "$SOURCE_DIR" > "$BACKUP_DIR/list.txt"

echo 'Some files in this folder are hidden by default.' > "$BACKUP_DIR/README.txt"

# Done

if [[ $? -eq 0 ]]; then
  echo $(date "$LOG_FMT") "Completed - Config backup saved to '$BACKUP_DIR'." >> $LOG_FILE
else
  echo $(date "$LOG_FMT") "Error - Config backup failed, please check output above." >> $LOG_FILE
fi
