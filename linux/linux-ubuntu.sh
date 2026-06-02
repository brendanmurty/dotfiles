#!/usr/bin/env bash
#
#
# Linux: Ubuntu 26.04 setup
#
#

REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS="$(bash $REPO/bin/os.sh)"

if [[ "$OS" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

echo 'Ubuntu: Requesting sudo'

sudo -v

echo 'Ubuntu: Fix broken system package dependencies'

sudo dpkg --configure -a

echo 'Ubuntu: Continue interrupted package installs'

sudo apt-get install -f

echo 'Ubuntu: Update package lists'

sudo apt update -qq

echo 'Ubuntu: Cleanup packages'

sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

echo 'Ubuntu: Install system software management apps'

sudo apt -qq --assume-yes install \
  gnome-software \
  software-properties-gtk

echo 'Ubuntu: Prompt Ubuntu Pro setup process'

sudo pro attach

echo 'Ubuntu: Fix Security Center display of Ubuntu Pro status'

sudo snap connect desktop-security-center:system-observe

if command -v flatpak >/dev/null 2>&1 ; then
  echo 'Ubuntu: Installing Flatpak apps'

  flatpak install --reinstall -y flathub com.mattjakeman.ExtensionManager >/dev/null 2>&1
  flatpak install --reinstall -y flathub io.missioncenter.MissionCenter >/dev/null 2>&1
  flatpak install --reinstall -y flathub ca.desrt.dconf-editor >/dev/null 2>&1
fi

echo 'Ubuntu: Installing Gnome Sushi document preview app'

sudo apt -qq --assume-yes install gnome-sushi

echo 'Ubuntu: Run Gnome Setup'

bash "$REPO/gnome/gnome-setup.sh"
