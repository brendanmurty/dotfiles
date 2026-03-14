#!/usr/bin/env bash
#
#
# Linux: Config to support Keychron keyboard harware
#   - Tested on Ubuntu 24
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

# Allow customisation of keys, lighting and firmware via https://launcher.keychron.com/

sudo cp "/etc/udev/rules.d/92-keychron.rules" "/etc/udev/rules.d/92-keychron.rules.before-dotfiles.bak"
sudo cp "$THIS_DIR/keychron-keyboards.rules.txt"  "/etc/udev/rules.d/92-keychron.rules"
sudo udevadm control --reload-rules
sudo udevadm trigger
ibus restart
