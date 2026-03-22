#!/usr/bin/env bash
#
#
# macOS: Dropbox fix common syncing issues
#
#

LIB="$(cd "$(dirname "$0")" && cd ../linux/lib && pwd)"
OS_NAME="$(bash $LIB/get-os-name.sh)"

if [[ "$OS_NAME" != "macOS" ]]; then
  echo "This script requires macOS."
  exit 0
fi

sudo chflags -R nouchg ~/Dropbox ~/.dropbox ~/.dropbox-master
sudo chown "$USER" "$HOME"
sudo chown -R "$USER" ~/Dropbox ~/.dropbox
sudo chmod -RN ~/.dropbox ~/Dropbox
chmod -R u+rw ~/Dropbox ~/.dropbox
