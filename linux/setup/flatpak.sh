#!/usr/bin/env bash
#
#
# Flatpak setup
#
#

LIB="$(cd "$(dirname "$0")" && cd ../lib && pwd)"
OS_NAME="$(bash $LIB/get-os-name.sh)"

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

# Install all packages from the package list file in this dir

xargs -a "./flatpak.packages.txt" flatpak install -y flathub

# Add main aliases for dev editors

touch "$HOME/.bash_aliases"

echo "alias zed='flatpak run dev.zed.Zed'" >> "$HOME/.bash_aliases"
echo "alias code='flatpak run com.visualstudio.code'" >> "$HOME/.bash_aliases"
