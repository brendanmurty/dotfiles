#!/usr/bin/env bash
#
#
# Flatpak setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" == "macOS" || "$OS" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
elif [[ "$OS" == "Ubuntu" || "$OS" == "Debian" ]]; then
  sudo apt -qq --assume-yes install flatpak gnome-software-plugin-flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
elif [[ "$OS" == "EndeavourOS" ]]; then
  sudo pacman -Syu
  sudo pacman -S flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
else
  echo "Please setup Flatpak manually for your OS: https://flathub.org/en/setup"
  exit 0
fi
