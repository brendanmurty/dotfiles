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
#

SCRIPT_DIR=$(dirname "$(realpath "$0")")

LOG_FILE="$SCRIPT_DIR/rclone-sync.log"
touch "$LOG_FILE"

cp -n "$SCRIPT_DIR/rclone-sync.env.sample" "$SCRIPT_DIR/rclone-sync.env"
source "$SCRIPT_DIR/rclone-sync.env"

# Setup sync check file

RCLONE_CHECK_FILE=".rclone.bisync.enabled.txt"

touch "$LOCAL_SYNC_DIR/$RCLONE_CHECK_FILE"
rclone touch "$RCLONE_REMOTE_NAME:/$RCLONE_CHECK_FILE"

echo "WARNING - RCLONE BISYNC ENABLED" > "$LOCAL_SYNC_DIR/$RCLONE_CHECK_FILE"
echo "Enabled by '$LOCAL_SYNC_USER' from '$HOSTNAME'." >> "$LOCAL_SYNC_DIR/$RCLONE_CHECK_FILE"

# Run the rclone bisync command in the background

nohup rclone bisync \
  "$LOCAL_SYNC_DIR" \
  "$RCLONE_REMOTE_NAME:/" \
  --check-access \
  --check-filename "$RCLONE_CHECK_FILE" \
  --workdir "$HOME/.rclone-sync" \
  --ignore-listing-checksum \
  --resync-mode newer \
  --recover \
  --create-empty-src-dirs \
  --resilient \
  --force \
  --inplace \
  --copy-links \
  --conflict-resolve newer \
  --conflict-loser delete \
  --refresh-times \
  --backup-dir1 "/home/$LOCAL_SYNC_USER/.local/share/Trash/files" \
  --drive-use-trash=true \
  --delete-after \
  --human-readable \
  --log-level INFO \
  --log-file "$LOG_FILE" \
  > /dev/null 2>&1 &
