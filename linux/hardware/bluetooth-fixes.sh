#!/usr/bin/env bash
#
#
# Ubuntu: Fix Bluetooth config to support high fidelity playback devices
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS="$(bash $BIN/os.sh)"

if [[ "$OS" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

sudo apt -qq update
sudo apt -qq --assume-yes upgrade

sudo apt -qq --assume-yes install \
  pavucontrol \
  pulseaudio-module-bluetooth

sudo systemctl restart bluetooth

systemctl --user --now enable wireplumber
