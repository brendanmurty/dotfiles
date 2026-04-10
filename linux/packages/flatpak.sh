#!/usr/bin/env bash
#
#
# Flatpak packages
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

# Install all packages from the package list file in this dir

xargs -a "$DIR/flatpak.packages.txt" flatpak install --reinstall -y flathub

# Cleanup

rm -rf "$HOME/.cache/flatpak"
mkdir -p "$HOME/.cache/flatpak"

# Run update to trigger Flatpak icon and desktop file refreshing

flatpak update -y
