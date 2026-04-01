#!/usr/bin/env bash
#
#
# Dropbox config
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

# Configure Dropbox if it's installed via Flatpak

if $(flatpak info com.dropbox.Client >/dev/null 2>&1); then
  flatpak run com.dropbox.Client start
  flatpak run com.dropbox.Client throttle unlimited unlimited
  flatpak run com.dropbox.Client autostart y

  mkdir -p "$HOME/.config/autostart"
  cp "$DIR/dropbox.desktop" "$HOME/.config/autostart/Dropbox.desktop"
fi
