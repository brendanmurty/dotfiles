#!/usr/bin/env bash
#
# Setup a background local bidirectional synced copy of a Rclone remote
#   - WARNING: The "rclone bisync" command will delete local files if they're removed
#     from the remote! Please confirm this is what you're after, more info at:
#     https://rclone.org/commands/rclone_bisync/
#   - Requires a Linux system with the rclone package installed
#   - Requires an existing Rclone remote config, more info at:
#     https://rclone.org/commands/rclone_config
#   - For the first run: bash /path/to/this/rclone-sync.sh initial
#   - For subsequent runs: bash /path/to/this/rclone-sync.sh standard
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
echo "WARNING - RCLONE BISYNC ENABLED" > "$LOCAL_SYNC_DIR/$RCLONE_CHECK_FILE"
echo "Enabled by '$USER' from '$HOSTNAME'." >> "$LOCAL_SYNC_DIR/$RCLONE_CHECK_FILE"
rclone touch "$LOCAL_SYNC_DIR/$RCLONE_CHECK_FILE"

# Fix local sync dir ownership

chown -R "$LOCAL_SYNC_DIR_OWNER_USER:$LOCAL_SYNC_DIR_OWNER_USER" "$LOCAL_SYNC_DIR"

# Configure the sync mode

if [ "$1" == "initial" ]; then
  SYNC_MODE="--resync"
else
  SYNC_MODE="--check-access"
fi

# Run the Rclone Bisync command in the background

nohup rclone bisync \
  "$LOCAL_SYNC_DIR" \
  "$RCLONE_REMOTE_NAME:/" \
  $SYNC_MODE \
  --check-filename "$RCLONE_CHECK_FILE" \
  --workdir "$HOME/.rclone-sync" \
  --create-empty-src-dirs \
  --max-delete 10 \
  --resilient \
  --verbose \
  --force \
  --inplace \
  --copy-links \
  --conflict-resolve newer \
  --conflict-loser num \
  --conflict-suffix conflict \
  --refresh-times \
  --max-lock 2m \
  --drive-use-trash=true \
  --delete-after \
  --log-file "$LOG_FILE" \
  > /dev/null 2>&1 &
