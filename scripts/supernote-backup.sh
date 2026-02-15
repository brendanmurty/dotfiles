#!/usr/bin/env bash
#
# Backup Supernote Items
#  - Makes a timestamped ZIP file backup of your entire Supernote Items directory
#  - Requires a Linux system and the zip package
#  - Saves output messages to the file set in LOG_FILE
#

SCRIPT_PATH="$(dirname "$(readlink -f "$0")")"

LOG_FILE="$SCRIPT_PATH/supernote-backup.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp -n "$SCRIPT_DIR/supernote-backup.sample.env" "$SCRIPT_DIR/supernote-backup.env"
source "$SCRIPT_DIR/supernote-backup.env"

BACKUP_FILE="supernote_$(date +%Y%m%d-%H%M%S).zip"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Ask to connect the device - only needed for local wired connection
# read -p "Is the device connected via a USB cable? (y/n) " -n 1 -r
# echo
# if [ "$REPLY" != "y" ]; then
#   echo $(date "$LOG_FMT") "Backup cancelled"
#   exit 1
# fi

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> $LOG_FILE
  exit 1
fi

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_PATH'..." >> $LOG_FILE

mkdir -p $BACKUP_DIR
cd $SOURCE_DIR
zip -qr $BACKUP_PATH .

# Done, print the relevant message

if [[ $? -eq 0 ]]; then
  echo $(date "$LOG_FMT") "Completed - Backup saved to '$BACKUP_PATH'." >> $LOG_FILE
else
  echo $(date "$LOG_FMT") "Error - Backup failed, please check output above." >> $LOG_FILE
fi
