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

cp -n "$SCRIPT_DIR/user-backup.env.sample" "$SCRIPT_DIR/user-backup.env"
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

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_PATH'" >> $LOG_FILE

mkdir -p $BACKUP_DIR
cd $SOURCE_DIR

# Create a copy of the current Grub config file

cp -f "/etc/default/grub" ".grub-config.txt"

# If cron is installed, save a copy of the user's cron items

if command -v crontab >/dev/null 2>&1 ; then
  echo $(sudo crontab -l -u "$SOURCE_USER_NAME") > ".user-crontab.txt"
fi

# Save a copy of the file listing, so symlink paths are logged

ls -lah "$SOURCE_DIR" > ".user-dir-list.txt"

# Save a copy of the installed Flatpak apps

flatpak list --app > ".flatpak-app-list.txt"

# Run the ZIP command with specific inclusions and exclusions

zip \
  --symlinks \
  --recurse-paths \
  --quiet \
  --password "$BACKUP_FILE_PASSWORD" \
  "$BACKUP_PATH" \
  .grub-config.txt \
  .flatpak-app-list.txt \
  .user-crontab.txt \
  .user-dir-list.txt \
  .bash_* \
  .profile \
  .face \
  .gitconfig \
  .gitignore \
  .config/autostart/* \
  .config/dconf/* \
  .config/nautilus/* \
  .config/rclone/* \
  .config/systemd/* \
  .config/zed/* \
  .local/bin/* \
  .local/share/applications/* \
  .local/share/backgrounds/* \
  .local/share/gnome-shell/extensions/* \
  .local/share/fonts/* \
  .local/share/sounds/* \
  Git/* \
  -x ".bash_history" \
  -x ".bash_logout" \
  -x "**/node_modules/*" \
  -x "**/.git/*" \
  -x "**/cache/*" \
  -x "*.sock" \
  -x "*.lock" \
  -x "*.pipe" \
  >/dev/null 2>&1

# Done

echo $(date "$LOG_FMT") "Finished." >> $LOG_FILE
