#!/usr/bin/env bash
#
# Backup Obsidian Notes
#  - Makes a timestamped ZIP file backup of your entire Obsidian notes directory
#  - Requires a Linux system and the zip package
#  - Saves output messages to the file set in LOG_FILE
#

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

LOG_FILE="$SCRIPT_DIR/obsidian-backup.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp -n "$SCRIPT_DIR/obsidian-backup.sample.env" "$SCRIPT_DIR/obsidian-backup.env"
source "$SCRIPT_DIR/obsidian-backup.env"

BACKUP_FILE=obsidian_$(date +%Y%m%d-%H%M%S).zip
BACKUP_PATH=$BACKUP_DIR/$BACKUP_FILE

echo $(date "$LOG_FMT") "Started script" >> "$LOG_FILE"

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> "$LOG_FILE"
  exit 1
fi

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_PATH'..." >> "$LOG_FILE"

mkdir -p $BACKUP_DIR
cd $SOURCE_DIR
zip -qr $BACKUP_PATH .

# Done

if [[ $? -eq 0 ]]; then
  echo $(date "$LOG_FMT") "Done - Backup saved to '$BACKUP_PATH'." >> "$LOG_FILE"
else
  echo $(date "$LOG_FMT") "Done - Error: backup failed, please check output above." >> "$LOG_FILE"
fi
