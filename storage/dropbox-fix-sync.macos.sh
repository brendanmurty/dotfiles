#!/usr/bin/env bash
#
#
# macOS: Dropbox fix common syncing issues
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "macOS" ]]; then
  echo "This script requires macOS."
  exit 0
fi

sudo chflags -R nouchg ~/Dropbox ~/.dropbox ~/.dropbox-master
sudo chown "$USER" "$HOME"
sudo chown -R "$USER" ~/Dropbox ~/.dropbox
sudo chmod -RN ~/.dropbox ~/Dropbox
chmod -R u+rw ~/Dropbox ~/.dropbox
