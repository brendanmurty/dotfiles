#!/usr/bin/env bash
#
# Run all backup scripts
#  - If cron is available, setup by running 'crontab -e', then adding a line like this:
#    0 19 * * * bash /home/username/scripts/backup-all.sh
#  - If systemd is available, refer to 'backup-all-custom-daily.service'
#

SCRIPTS_DIR=$(dirname "$(realpath "$0")")

bash "$SCRIPTS_DIR/user-backup-config.sh"

bash "$SCRIPTS_DIR/user-backup.sh"

bash "$SCRIPTS_DIR/obsidian-backup.sh"

bash "$SCRIPTS_DIR/supernote-backup.sh"
