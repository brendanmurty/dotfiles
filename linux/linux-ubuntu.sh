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

echo 'Requesting sudo'

sudo -v

echo 'Fix broken system package dependencies'

sudo dpkg --configure -a

echo 'Continue interupted package installs'

sudo apt-get install -f

echo 'Update package lists'

sudo apt update -qq

echo 'Cleanup packages'

sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

echo 'Install the Software & Updates app'

sudo apt -qq --assume-yes install \
  software-properties-gtk

echo 'Prompt Ubuntu Pro setup process'

sudo pro attach

echo 'Fix Security Center display of Ubuntu Pro status'

sudo snap connect desktop-security-center:system-observe

if command -v flatpak >/dev/null 2>&1 ; then
  echo 'Installing Flatpak apps'

  flatpak install --reinstall -y com.mattjakeman.ExtensionManager
  flatpak install --reinstall -y io.missioncenter.MissionCenter
  flatpak install --reinstall -y page.tesk.Refine
  flatpak install --reinstall -y ca.desrt.dconf-editor
  flatpak install --reinstall -y best.ellie.StartupConfiguration
fi
