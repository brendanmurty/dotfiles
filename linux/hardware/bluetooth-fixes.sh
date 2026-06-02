#!/usr/bin/env bash
#
#
# Ubuntu: Fix Bluetooth config to support high fidelity playback devices
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"
BIN="$REPO/bin"

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
