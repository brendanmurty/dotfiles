#!/usr/bin/env bash

# Backup Obsidian Notes
#  - Makes a timestamped ZIP file backup of your entire Obsidian notes directory
#  - Saves output messages to the file set in LOG_FILE
#  - Requires zip, install with: sudo apt install zip
#  - Requires a Linux system
#  - Tested on Ubuntu 24.04, may need some tweaks for other distributions

BACKUP_DIR=$HOME"/Backups"
SOURCE_DIR=$HOME"/Notes"

BACKUP_FILE=obsidian_$(date +%Y%m%d-%H%M%S).zip

BACKUP_PATH=$BACKUP_DIR/$BACKUP_FILE

SCRIPT_PATH="$(dirname "$(readlink -f "$0")")"

LOG_FILE=$SCRIPT_PATH/backup-obsidian.log
touch $LOG_FILE

LOG_DATE_FORMAT="+%Y-%m-%d %H:%M:%S"

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_DATE_FORMAT") "Error - Notes source directory ($SOURCE_DIR) not found, please check the path in the script" >> $LOG_FILE
  exit 1
fi

# Start backup process

echo $(date "$LOG_DATE_FORMAT") "Starting backup of your Notes in '$SOURCE_DIR' to '$BACKUP_PATH'..." >> $LOG_FILE

mkdir -p $BACKUP_DIR
cd $SOURCE_DIR
zip -qr $BACKUP_PATH .

# Done, print the relevant message

if [[ $? -eq 0 ]]; then
  echo $(date "$LOG_DATE_FORMAT") "Completed - Backup saved to '$BACKUP_PATH'." >> $LOG_FILE
else
  echo $(date "$LOG_DATE_FORMAT") "Error - Backup failed, please check output above." >> $LOG_FILE
fi

