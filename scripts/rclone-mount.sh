#!/usr/bin/env bash
#
# Setup a local mount of a Rclone remote
#   - Requires a Linux system
#   - Requires an existing Rclone remote config ready to use
#

SCRIPT_DIR=$(dirname "$(realpath "$0")")

LOG_FILE="$SCRIPT_DIR/rclone-mount.log"
touch "$LOG_FILE"

cp -n "$SCRIPT_DIR/rclone-mount.sample.env" "$SCRIPT_DIR/rclone-mount.env"
source "$SCRIPT_DIR/rclone-mount.env"

rclone mount \
  $RCLONE_REMOTE_NAME:/ \
  $LOCAL_SYNC_DIR \
  --vfs-cache-mode full \
  --vfs-cache-max-age=9999h \
  --vfs-fast-fingerprint \
  --dir-cache-time 9999h \
  --vfs-cache-max-size 0 \
  --allow-non-empty \
  --allow-other \
  --dir-perms 777 \
  --file-perms 777 \
  --poll-interval 0m30s \
  --log-file $LOG_FILE \
  --log-format "%t %L: %o" \
  --daemon \
