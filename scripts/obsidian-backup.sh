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

cp --update=none "$SCRIPT_DIR/obsidian-backup.env.sample" "$SCRIPT_DIR/obsidian-backup.env"
source "$SCRIPT_DIR/obsidian-backup.env"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="obsidian_$(date +%Y%m%d-%H%M%S).zip"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

echo $(date "$LOG_FMT") "Started script" >> "$LOG_FILE"

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> "$LOG_FILE"
  exit 0
fi

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_PATH'..." >> "$LOG_FILE"

mkdir -p "$BACKUP_DIR"
cd "$SOURCE_DIR"
zip -qr "$BACKUP_PATH" "."

# Done

echo $(date "$LOG_FMT") "Finished." >> "$LOG_FILE"
