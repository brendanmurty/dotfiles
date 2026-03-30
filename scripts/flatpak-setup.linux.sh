#!/usr/bin/env bash
#
#
# Flatpak setup
#
#

SCRIPTS="$(cd "$(dirname "$0")" && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
elif [[ "$OS_NAME" == "Ubuntu" ]]; then
  sudo apt -qq --assume-yes install flatpak gnome-software-plugin-flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
elif [[ "$OS_NAME" == "EndeavourOS" ]]; then
  sudo pacman -Syu
  sudo pacman -S flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
else
  echo "Please setup Flatpak manually for your OS: https://flathub.org/en/setup"
  exit 0
fi
