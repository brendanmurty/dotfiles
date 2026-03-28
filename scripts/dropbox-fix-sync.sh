#!/usr/bin/env bash
#
#
# Linux: Dropbox fix common syncing issues
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
OS_NAME="$(bash $THIS_DIR/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

sudo chown "$USER" "$HOME"
sudo chown -R "$USER" ~/Dropbox ~/.dropbox
sudo chattr -R -i ~/Dropbox
sudo chmod -R u+rw ~/Dropbox ~/.dropbox
