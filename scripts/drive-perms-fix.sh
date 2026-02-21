#!/usr/bin/env bash
#
# Allow multiple users to access and write to a certain dir tree
#

SCRIPT_DIR=$(dirname "$(realpath "$0")")

LOG_FILE="$SCRIPT_DIR/drive-perms-fix.log"
LOG_FMT="+%Y-%m-%d %H:%M:%S"
touch "$LOG_FILE"

cp --update=none "$SCRIPT_DIR/drive-perms-fix.env.sample" "$SCRIPT_DIR/drive-perms-fix.env"
source "$SCRIPT_DIR/drive-perms-fix.env"

echo $(date "$LOG_FMT") 'Start' > "$LOG_FILE"

sudo groupadd -f "$GROUP_NAME"

sudo usermod -aG "$GROUP_NAME" "$USER_NAME1"

sudo usermod -aG "$GROUP_NAME" "$USER_NAME2"

sudo chgrp -R "$GROUP_NAME" "$DIR_PATH"

# Custom ownership for certain dirs
sudo chown -R "$USER_NAME1":"$GROUP_NAME" "$DIR_PATH/Dropbox"
sudo chown -R "$USER_NAME1":"$GROUP_NAME" "$DIR_PATH/SteamLibrary"
sudo chown -R "$USER_NAME1":"$GROUP_NAME" "$DIR_PATH/Bottles/$USER_NAME1"
sudo chown -R "$USER_NAME2":"$GROUP_NAME" "$DIR_PATH/Bottles/$USER_NAME2"
sudo chown -R "$USER_NAME1":"$GROUP_NAME" "$DIR_PATH/Docker/$USER_NAME1"
sudo chown -R "$USER_NAME2":"$GROUP_NAME" "$DIR_PATH/Docker/$USER_NAME2"

# Allow read and write access to the whole dir tree for the right users
sudo chmod -R 777 "$DIR_PATH"

echo $(date "$LOG_FMT") 'Finished.' >> "$LOG_FILE"
