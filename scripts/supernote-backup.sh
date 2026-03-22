#!/usr/bin/env bash
#
# Backup Supernote Items
#  - Makes a timestamped ZIP file backup of your entire Supernote Items directory
#  - Requires a Linux system and the zip package
#  - Saves output messages to the file set in LOG_FILE
#

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

LOG_FILE="$SCRIPT_DIR/supernote-backup.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp --update=none "$SCRIPT_DIR/supernote-backup.env.sample" "$SCRIPT_DIR/supernote-backup.env"
source "$SCRIPT_DIR/supernote-backup.env"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="supernote_$(date +%Y%m%d-%H%M%S).zip"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Ask to connect the device - only needed for local wired connection
# read -p "Is the device connected via a USB cable? (y/n) " -n 1 -r
# echo
# if [ "$REPLY" != "y" ]; then
#   echo $(date "$LOG_FMT") "Backup cancelled"
#   exit 0
# fi

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> $LOG_FILE
  exit 0
fi

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_PATH'..." >> $LOG_FILE

mkdir -p "$BACKUP_DIR"
cd $SOURCE_DIR
zip -qr "$BACKUP_PATH" "."

# Done

echo $(date "$LOG_FMT") "Finished." >> $LOG_FILE
