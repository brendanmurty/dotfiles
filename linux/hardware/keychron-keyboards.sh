#!/usr/bin/env bash
#
#
# Ubuntu or Fedora: Config to support Keychron keyboard harware
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]] && [[ "$OS_NAME" != "Fedora Linux" ]]; then
  echo "This script requires Ubuntu or Fedora."
  exit 0
fi

# Allow customisation of keys, lighting and firmware via https://launcher.keychron.com/

sudo cp "$THIS_DIR/keychron-keyboards.rules"  "/etc/udev/rules.d/92-keychron-keyboards.rules"

sudo udevadm control --reload-rules
sudo udevadm trigger

ibus restart
