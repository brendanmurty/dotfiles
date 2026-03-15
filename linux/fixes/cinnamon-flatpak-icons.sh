#!/usr/bin/env bash
#
#
# Linux: Fix Flatpak app icons and pin to panel in Cinnamon
#   - After running this, open the global application menu, find the app, pin to Panel from there
#
#

flatpak update

for f in $(find /var/lib/flatpak/app/ -depth -type f -name '*.desktop'); do
  do cp -v $f ~/.local/share/applications/$(basename $f);
done
