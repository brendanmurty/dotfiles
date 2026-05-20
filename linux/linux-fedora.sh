#!/usr/bin/env bash
#
#
# Linux: Fedora 44 setup
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" != "Fedora Linux" ]]; then
  echo "This script requires Fedora."
  exit 0
fi

echo 'Fedora: Install required packages'

sudo dnf install -y git vim curl

if command -v flatpak >/dev/null 2>&1 ; then
  echo 'Fedora: Installing Flatpak apps'

  flatpak install --reinstall -y com.mattjakeman.ExtensionManager
  flatpak install --reinstall -y io.missioncenter.MissionCenter
  flatpak install --reinstall -y page.tesk.Refine
  flatpak install --reinstall -y ca.desrt.dconf-editor
  flatpak install --reinstall -y best.ellie.StartupConfiguration
fi
