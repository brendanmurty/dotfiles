#!/usr/bin/env bash
#
#
# Linux: Install Google Chrome
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

# Install Google Chrome via Flatpak
flatpak install --reinstall -y flathub com.google.Chrome

# Allow Chrome to access files in the user home dir
flatpak override --user --filesystem=home com.google.Chrome

# Fix Webcam video output display issues
flatpak override --user --env="CHROME_EXTRA_FLAGS=--disable-gpu-compositing" com.google.Chrome
