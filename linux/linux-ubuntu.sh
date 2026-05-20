#!/usr/bin/env bash
#
#
# Linux: Ubuntu 26.04 setup
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

echo 'Ubuntu: Requesting sudo'

sudo -v

echo 'Ubuntu: Fix broken system package dependencies'

sudo dpkg --configure -a

echo 'Ubuntu: Continue interupted package installs'

sudo apt-get install -f

echo 'Ubuntu: Update package lists'

sudo apt update -qq

echo 'Ubuntu: Cleanup packages'

sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

echo 'Ubuntu: Install the Software & Updates app'

sudo apt -qq --assume-yes install \
  software-properties-gtk

echo 'Ubuntu: Prompt Ubuntu Pro setup process'

sudo pro attach

echo 'Ubuntu: Fix Security Center display of Ubuntu Pro status'

sudo snap connect desktop-security-center:system-observe

if command -v flatpak >/dev/null 2>&1 ; then
  echo 'Ubuntu: Installing Flatpak apps'

  flatpak install --reinstall -y flathub com.mattjakeman.ExtensionManager >/dev/null 2>&1
  flatpak install --reinstall -y flathub io.missioncenter.MissionCenter >/dev/null 2>&1
  flatpak install --reinstall -y flathub page.tesk.Refine >/dev/null 2>&1
  flatpak install --reinstall -y flathub ca.desrt.dconf-editor >/dev/null 2>&1
  flatpak install --reinstall -y flathub best.ellie.StartupConfiguration >/dev/null 2>&1
fi
