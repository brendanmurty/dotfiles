#!/usr/bin/env bash
#
#
# Linux: Debian 13 setup
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS="$(bash $REPO_DIR/bin/os.sh)"

if [[ "$OS" != "Debian" ]]; then
  echo "This script requires Debian."
  exit 0
fi

echo 'Debian: Requesting sudo'

sudo -v

echo 'Debian: Enable 32-bit architecture'

sudo dpkg --add-architecture i386 >/dev/null 2>&1

echo 'Debian: Add contrib and non-free APT repositories'

sudo sed -i 's/main non-free-firmware/main contrib non-free non-free-firmware/g' /etc/apt/sources.list

echo 'Debian: Update package lists'

sudo apt update -qq >/dev/null 2>&1

echo 'Debian: Install Nvidia drivers'

sudo apt install -qq --assume-yes --reinstall \
	firmware-linux \
	nvidia-driver \
	nvidia-kernel-dkms \
	linux-headers-$(uname -r) >/dev/null 2>&1

echo 'Debian: Improve audio hardware support'

sudo apt -qq --assume-yes install pipewire-audio-client-libraries pipewire-pulse easyeffects >/dev/null 2>&1

echo 'Debian - Set non-responding app warning timeout to 1 min'

gsettings set org.gnome.mutter check-alive-timeout 60000

echo 'Debian: Setup Flatpak'

bash "$REPO_DIR/linux/linux-flatpak.sh"

if command -v flatpak >/dev/null 2>&1 ; then
  echo 'Debian: Installing Flatpak apps'

  flatpak install --reinstall -y flathub com.mattjakeman.ExtensionManager >/dev/null 2>&1
  flatpak install --reinstall -y flathub io.missioncenter.MissionCenter >/dev/null 2>&1
  flatpak install --reinstall -y flathub ca.desrt.dconf-editor >/dev/null 2>&1
fi

echo 'Debian: Installing Gnome Sushi document preview app'

sudo apt -qq --assume-yes install gnome-sushi

echo 'Debian: Run Gnome Setup'

bash "$REPO_DIR/gnome/gnome-setup.sh"
