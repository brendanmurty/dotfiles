#!/usr/bin/env bash
#
#
# Backup some of the current Linux User's config files
#  - Makes a timestamped and password protected ZIP file of some parts of your User directory
#  - Include and exclude rules (starting with "-x") are set in the "zip" command below
#  - Saves symlinks as links, not as directories
#  - Saves output messages to the file set in LOG_FILE
#  - If your system's scheduler is cron, setup by running 'crontab -e', then adding a line:
#    0 19 * * * bash /home/username/scripts/user-backup.sh
#  - If your system's scheduler is systemd, refer to 'user-backup.service'
#
#

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

LOG_FILE="$SCRIPT_DIR/user-backup.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp --update=none "$SCRIPT_DIR/user-backup.env.sample" "$SCRIPT_DIR/user-backup.env"
source "$SCRIPT_DIR/user-backup.env"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="user-${BACKUP_USER_NAME}_$(date +%Y%m%d-%H%M%S).zip"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Exit if the source directory doesn't exist

if [ ! -d $SOURCE_DIR ]; then
  echo $(date "$LOG_FMT") "Error - Source directory ($SOURCE_DIR) not found, please check the path in the script" >> "$LOG_FILE"
  exit 0
fi

# Start backup process

echo $(date "$LOG_FMT") "Starting backup of '$SOURCE_DIR' to '$BACKUP_PATH'" >> "$LOG_FILE"

mkdir -p "$BACKUP_DIR"

if [ -d "$SOURCE_DIR/.backups" ]; then
  gio trash "$SOURCE_DIR/.backups"
fi

mkdir -p "$SOURCE_DIR/.backups"

# Create a copy of the current Grub config file

if [ -f "/etc/default/grub" ]; then
  cp -f "/etc/default/grub" "$SOURCE_DIR/.backups/grub-config.txt"
fi

# Save a copy of the user cron items

if command -v crontab >/dev/null 2>&1 ; then
  crontab -l > "$SOURCE_DIR/.backups/crontab-user.txt"
fi

# Save a copy of the file listing, so symlink paths are logged

ls -lah "$SOURCE_DIR" > "$SOURCE_DIR/.backups/dir-list-user.txt"

# Save a list of all installed Pacman packages

if command -v pacman >/dev/null 2>&1 ; then
  pacman -Qqen > "$SOURCE_DIR/.backups/package-list-pacman.txt"
fi

# Save a list of all installed Flatpak packages

if command -v flatpak >/dev/null 2>&1 ; then
  flatpak list --app --columns=application > "$SOURCE_DIR/.backups/package-list-flatpak.txt"
fi

# Save a list of all installed Snap packages

if command -v snap >/dev/null 2>&1 ; then
  snap list --unicode=never | tail -n +2 | grep -v 'core\|gnome-\|snapd\|snap-store\|bare\|canonical-livepatch' | awk '{print $1}' > "$SOURCE_DIR/.backups/package-list-snap.txt"
fi

# Save a list of all installed Homebrew packages

if command -v brew >/dev/null 2>&1 ; then
  brew leaves > "$SOURCE_DIR/.backups/package-list-homebrew.txt"
fi

# Save a list of all Dconf settings

if command -v dconf >/dev/null 2>&1 ; then
  dconf dump / > "$SOURCE_DIR/.backups/dconf-user-export.conf"
fi

# Run the ZIP command with specific inclusions and exclusions

cd $SOURCE_DIR

zip \
  --symlinks \
  --recurse-paths \
  --quiet \
  --password "$BACKUP_FILE_PASSWORD" \
  "$BACKUP_PATH" \
  .backups/* \
  .bashrc \
  .bash_* \
  .profile \
  justfile \
  .face \
  .gitconfig \
  .gitignore \
  .config/mimeapps.list \
  .config/user-dirs.dirs \
  .config/user-dirs.locale \
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
  .dconf/* \
  .gtk-3.0/* \
  .gtk-4.0/* \
  .gnupg/* \
  .password-store/* \
  .pki/* \
  .ssh/* \
  Git/* \
  -x "**/node_modules/*" \
  -x "**/.git/*" \
  -x "**/cache/*" \
  -x "*.sock" \
  -x "*.lock" \
  -x "*.pipe" \
  >/dev/null 2>&1

# Done

echo $(date "$LOG_FMT") "Finished." >> "$LOG_FILE"
