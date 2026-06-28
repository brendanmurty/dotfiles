#!/usr/bin/env bash
#
#
# Linux Mint 22 setup
#
#

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" != "Mint" ]]; then
  error "This script requires Linux Mint."
  exit 0
fi

info 'Linux Mint: Requesting sudo'

sudo -v

info 'Linux Mint: Update package lists'

sudo apt update -qq > /dev/null 2>&1

if command -v flatpak > /dev/null 2>&1 ; then
  info 'Linux Mint: Installing Flatpak apps'

  flatpak install -y io.missioncenter.MissionCenter > /dev/null 2>&1
  flatpak install -y net.nokyan.Resources > /dev/null 2>&1
  flatpak install -y ca.desrt.dconf-editor > /dev/null 2>&1
fi

info 'Linux Mint: Installing Nemo Preview document preview app'

sudo apt -qq --assume-yes install nemo-preview > /dev/null 2>&1

info 'Linux Mint: Disabling printer notifications'

sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed
