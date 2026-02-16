#!/usr/bin/env bash
#
# Setup a background local bidirectional synced copy of a Rclone remote for Google Drive
#   - WARNING: The "rclone bisync" command will delete local files if they're removed
#     from the remote! Please confirm this is what you're after, more info at:
#     https://rclone.org/commands/rclone_bisync/
#   - Requires a Linux system with the rclone package installed
#   - Requires an existing Rclone remote config, more info at:
#     https://rclone.org/commands/rclone_config
#   - View a running log of the sync process: tail -n 50 -f ./rclone-sync.log
#   - Force quit all Rclone processes: sudo killall rclone
#   - View the web GUI to see progress of rclone syncs: rclone rcd --rc-web-gui
#

SCRIPT_DIR=$(dirname "$(realpath "$0")")

LOG_FILE="$SCRIPT_DIR/rclone-gdrive-sync.log"
touch "$LOG_FILE"

cp -n "$SCRIPT_DIR/rclone-gdrive-sync.env.sample" "$SCRIPT_DIR/rclone-gdrive-sync.env"
source "$SCRIPT_DIR/rclone-gdrive-sync.env"

# Customise the local directory icons

SYNC_ICONS="$LOCAL_SYNC_DIR/.icons"
rm -rf "$SYNC_ICONS"
mkdir -p "$SYNC_ICONS"
cp /usr/share/icons/Adwaita/scalable/places/* "$SYNC_ICONS/"

gio set -t string "$LOCAL_SYNC_DIR" metadata::custom-icon "file://$SYNC_ICONS/user-bookmarks.svg"
gio set -t string "$LOCAL_SYNC_DIR/Desktop" metadata::custom-icon "file://$SYNC_ICONS/folder-desktop.svg"
gio set -t string "$LOCAL_SYNC_DIR/Documents" metadata::custom-icon "file://$SYNC_ICONS/folder-documents.svg"
gio set -t string "$LOCAL_SYNC_DIR/Images" metadata::custom-icon "file://$SYNC_ICONS/folder-pictures.svg"
gio set -t string "$LOCAL_SYNC_DIR/Documents/Templates" metadata::custom-icon "file://$SYNC_ICONS/folder-templates.svg"
gio set -t string "$LOCAL_SYNC_DIR/Music" metadata::custom-icon "file://$SYNC_ICONS/folder-music.svg"
gio set -t string "$LOCAL_SYNC_DIR/Shared" metadata::custom-icon "file://$SYNC_ICONS/folder-publicshare.svg"

# Run the rclone bisync command in the background

nohup rclone bisync \
  "$LOCAL_SYNC_DIR" \
  "$RCLONE_REMOTE_NAME:/" \
  --workdir "$HOME/.rclone-sync" \
  --transfers 15 \
  --ignore-listing-checksum \
  --resync-mode newer \
  --no-slow-hash \
  --recover \
  --resilient \
  --force \
  --inplace \
  --copy-links \
  --create-empty-src-dirs \
  --conflict-resolve newer \
  --conflict-loser delete \
  --refresh-times \
  --backup-dir1 "/home/$LOCAL_SYNC_USER/.local/share/Trash/files" \
  --drive-use-trash=true \
  --delete-after \
  --human-readable \
  --contimeout 1m \
  --timeout 1m \
  --log-level INFO \
  --log-file "$LOG_FILE" \
  > /dev/null 2>&1 &
