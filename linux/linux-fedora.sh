#!/usr/bin/env bash
#
#
# Linux: Fedora 44 setup
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS="$(bash $REPO_DIR/bin/os.sh)"

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
  flatpak install --reinstall -y flathub page.tesk.Refine >/dev/null 2>&1
  flatpak install --reinstall -y flathub ca.desrt.dconf-editor >/dev/null 2>&1
  flatpak install --reinstall -y flathub best.ellie.StartupConfiguration >/dev/null 2>&1
fi

echo 'Fedora: Run Gnome Setup'

bash "$REPO_DIR/gnome/gnome-setup.sh"
