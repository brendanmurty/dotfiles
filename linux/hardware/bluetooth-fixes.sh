#!/usr/bin/env bash
#
#
# Linux: Fix Bluetooth config to support high fidelity playback devices
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

sudo apt -qq update
sudo apt -qq --assume-yes upgrade

sudo apt -qq --assume-yes install \
  pavucontrol \
  pulseaudio-module-bluetooth

sudo systemctl restart bluetooth

systemctl --user --now enable wireplumber
