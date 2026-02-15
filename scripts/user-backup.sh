#!/usr/bin/env bash
#
# Backup a linux User
#  - Makes a timestamped ZIP file backup of your entire User directory
#  - Excludes some files and folders via "x" params in the "zip" command below
#  - Saves symlinks as links, not as directories, so it assumes those directories are safe
#  - Saves output messages to the file set in LOG_FILE
#  - Requires zip, install with: sudo apt install zip
#

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

LOG_FILE="$SCRIPT_DIR/user-backup.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp -n "$SCRIPT_DIR/user-backup.sample.env" "$SCRIPT_DIR/user-backup.env"
source "$SCRIPT_DIR/user-backup.env"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="user_$(date +%Y%m%d-%H%M%S).zip"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> $LOG_FILE
  exit 1
fi

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_PATH'..." >> $LOG_FILE

mkdir -p $BACKUP_DIR

cd $SOURCE_DIR

zip \
  -q \
  -y \
  -r \
  $BACKUP_PATH \
  . \
  -x ".cache/*" \
  -x "**/cache/*" \
  -x ".1password/*" \
  -x ".ssh/*" \
  -x ".gnugpg/*" \
  -x ".password-store/*" \
  -x ".pki/*" \
  -x ".nv/*" \
  -x ".steam/*" \
  -x ".var/app/io.missioncenter.MissionCenter/*" \
  -x "Backups/*" \
  -x "Dropbox/*" \
  -x "Games/*" \
  -x "Machines/*" \
  -x "**/node_modules/*" \
  -x "**/.git/*" \
  -x "Steam/*" \
  -x ".local/share/Steam/*" \
  -x ".local/share/zed/*" \
  -x ".local/zed.app/*" \
  -x ".docker/*" \
  -x ".dropbox/*" \
  -x ".dropbox-dist/*" \
  -x ".steam/*" \
  -x ".var/app/com.discordapp.Discord/*" \
  -x ".config/google-chrome/*" \
  -x ".steampath" \
  -x ".steampid" \
  -x "*.sock" \
  -x "*.lock" \
  -x "*.pipe" \
  --log-append \
  --logfile-path $LOG_FILE

# Done

if [[ $? -eq 0 ]]; then
  echo $(date "$LOG_FMT") "Completed - Backup saved to '$BACKUP_PATH'." >> $LOG_FILE
else
  echo $(date "$LOG_FMT") "Error - Backup failed, please check output above." >> $LOG_FILE
fi
