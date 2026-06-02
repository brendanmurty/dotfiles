#!/usr/bin/env bash
#
#
# Linux: Fedora 44 setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" != "Fedora" ]]; then
  echo "This script requires Fedora."
  exit 0
fi

echo 'Fedora: Install required packages'

sudo dnf install -y git vim curl >/dev/null 2>&1

echo 'Fedora: Configure Vim as the default editor'

sudo dnf install -y vim-default-editor --allowerasing >/dev/null 2>&1

if command -v flatpak >/dev/null 2>&1 ; then
  echo 'Fedora: Installing Flatpak apps'

  flatpak install --reinstall -y flathub com.mattjakeman.ExtensionManager >/dev/null 2>&1
  flatpak install --reinstall -y flathub io.missioncenter.MissionCenter >/dev/null 2>&1
  flatpak install --reinstall -y flathub ca.desrt.dconf-editor >/dev/null 2>&1
fi

echo 'Fedora: Installing Gnome Sushi document preview app'

sudo dnf install -y sushi >/dev/null 2>&1

echo 'Fedora: Run Gnome Setup'

bash "$REPO/linux/gnome/gnome-setup.sh"
