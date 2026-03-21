#!/usr/bin/env bash
#
#
# Linux: Config to support Keychron keyboard harware
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

# Allow customisation of keys, lighting and firmware via https://launcher.keychron.com/

sudo cp "$THIS_DIR/keychron-keyboards.txt"  "/etc/udev/rules.d/92-keychron.rules"
sudo udevadm control --reload-rules
sudo udevadm trigger
ibus restart
