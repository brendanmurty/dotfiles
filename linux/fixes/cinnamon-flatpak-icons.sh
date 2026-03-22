#!/usr/bin/env bash
#
#
# Linux: Fix Flatpak app icons and pin to panel in Cinnamon
#   - After running this, open the global application menu, find the app, pin to Panel from there
#
#

PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 1
fi

flatpak update

for f in $(find /var/lib/flatpak/app/ -depth -type f -name '*.desktop'); do
  do cp -v $f ~/.local/share/applications/$(basename $f);
done
