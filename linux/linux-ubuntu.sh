#!/usr/bin/env bash
#
#
# Linux: Ubuntu 26.04 setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

echo 'Ubuntu: Requesting sudo'

sudo -v

echo 'Ubuntu: Update package lists'

sudo apt update -qq

echo 'Ubuntu: Cleanup packages'

sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

echo 'Ubuntu: Install base system packages'

sudo apt -qq --assume-yes install \
  gnome-software \
  software-properties-gtk \
  gnome-tweaks \
  curl \
  git \
  zip \
  vim \
  gnome-sushi \
  gnome-browser-connector \
  python3 \
  pipx

echo 'Ubuntu: Prompt Ubuntu Pro setup process'

sudo pro attach

echo 'Ubuntu: Fix Security Center display of Ubuntu Pro status'

sudo snap connect desktop-security-center:system-observe

echo 'Ubuntu: Run Gnome Setup'

bash "$REPO/linux/gnome/gnome-setup.sh"

if command -v flatpak > /dev/null 2>&1 ; then
  echo 'Ubuntu: Installing Flatpak apps'

  flatpak install -y --system flathub net.nokyan.Resources > /dev/null 2>&1
  flatpak install -y --system flathub com.github.tchx84.Flatseal > /dev/null 2>&1
  flatpak install -y --system flathub com.mattjakeman.ExtensionManager > /dev/null 2>&1
  flatpak install -y --system flathub ca.desrt.dconf-editor > /dev/null 2>&1
fi
