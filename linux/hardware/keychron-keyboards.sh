#!/usr/bin/env bash
#
#
# Linux: Config to support Keychron keyboard harware
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="$(cd "$(dirname "$0")" && cd ../../bin && pwd)"
OS="$(bash $BIN/os.sh)"

if [[ "$OS" == "macOS" ]] || [[ "$OS" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

echo 'Keychron Keyboards: Allow customisation of keys, lighting and firmware via https://launcher.keychron.com/'

sudo cp "$THIS_DIR/keychron-keyboards.rules" "/etc/udev/rules.d/92-keychron-keyboards.rules"

sudo udevadm control --reload-rules
sudo udevadm trigger

ibus restart
