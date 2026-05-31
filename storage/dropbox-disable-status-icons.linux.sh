#!/usr/bin/env bash
#
#
# Linux: Disable Dropbox file sync checkmark icon overlays in Linux file managers
#
#

BIN="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $BIN/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

cd "$HOME/.dropbox-dist/dropbox-lnx.x86_64-52.3.55/images/emblems"

mv emblem-dropbox-uptodate.icon emblem-dropbox-uptodate.icon.bak
mv emblem-dropbox-uptodate.png emblem-dropbox-uptodate.png.bak
