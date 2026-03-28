#!/usr/bin/env bash
#
#
# Flatpak packages
#   - The package list can be updated with: flatpak list --app --columns=application > "./flatpak.packages.txt"
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

xargs -a "$DIR/flatpak.packages.txt" flatpak install -y flathub
