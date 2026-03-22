#!/usr/bin/env bash
#
#
# Linux: Config to support Keychron keyboard harware
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

# Allow customisation of keys, lighting and firmware via https://launcher.keychron.com/

sudo cp "$THIS_DIR/keychron-keyboards.txt"  "/etc/udev/rules.d/92-keychron.rules"
sudo udevadm control --reload-rules
sudo udevadm trigger
ibus restart
