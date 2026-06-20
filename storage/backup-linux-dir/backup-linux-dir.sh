#!/usr/bin/env bash
#
#
# Backup a directory as a password-protected ZIP file
#  - Makes a timestamped and password protected ZIP file of some parts of your User directory
#  - Include and exclude rules (starting with "-x") are set in the "zip" command below
#  - Saves symlinks as links, not as directories
#  - Saves output messages to the file set in LOG_FILE
#  - If your system's scheduler is cron, setup by running 'crontab -e', then adding a line:
#    0 19 * * * bash /home/username/dotfiles/storage/backup-linux-dir/backup-linux-dir.sh
#  - If your system's scheduler is systemd, refer to 'backup-linux-dir.service'
#
#

DIR="$(dirname "$(readlink -f "$0")")"

LOG_FILE="$DIR/backup-linux-dir.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp --update=none "$DIR/.backup-linux-dir.sample.env" "$DIR/.backup-linux-dir.env"
source "$DIR/.backup-linux-dir.env"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="${BACKUP_FILE_PREFIX}_$(date +%Y%m%d-%H%M%S).zip"
BACKUP_FILE_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> "$LOG_FILE"
  exit 0
fi

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_FILE_PATH'" >> "$LOG_FILE"

mkdir -p "$BACKUP_DIR"

# Run the ZIP command with specific inclusions and exclusions

cd $SOURCE_DIR

zip \
  --symlinks \
  --recurse-paths \
  --quiet \
  --password "$BACKUP_FILE_PASSWORD" \
  "$BACKUP_FILE_PATH" \
  . \
  -x "**/node_modules/*" \
  -x "**/cache/*" \
  -x "**/.cache/*" \
  -x ".cache/*" \
  -x ".docker/*" \
  -x "**/.venv/*" \
  -x "**/uv/*" \
  -x "*.sock" \
  -x "*.pipe" # > /dev/null 2>&1

# Done

echo $(date "$LOG_FMT") "Finished." >> "$LOG_FILE"
