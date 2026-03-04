#!/usr/bin/env bash
#
# Setup a background upload of a directory to Google Drive
#   - Requires a Linux system with the rclone package installed
#   - Requires an existing Rclone remote config, more info at:
#     https://rclone.org/commands/rclone_config
#   - Force quit all Rclone processes: sudo killall rclone
#   - View the web GUI to see progress of rclone syncs: rclone rcd --rc-web-gui
#   - More info at https://rclone.org/googlephotos/
#

SCRIPT_DIR=$(dirname "$(realpath "$0")")

LOG_FILE="$SCRIPT_DIR/rclone-gphotos-sync.log"
touch "$LOG_FILE"

cp --update=none "$SCRIPT_DIR/rclone-gphotos-sync.env.sample" "$SCRIPT_DIR/rclone-gphotos-sync.env"
source "$SCRIPT_DIR/rclone-gphotos-sync.env"

# Run the rclone copy command in the background

nohup rclone copy \
  "$LOCAL_SYNC_DIR" \
  "$RCLONE_REMOTE_NAME:/upload" \
  --progress \
  --exclude "*.json" \
  --contimeout 1m \
  --timeout 1m
  --log-level INFO \
  --log-file "$LOG_FILE" \
  > /dev/null 2>&1 &
