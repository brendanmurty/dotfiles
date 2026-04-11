#!/usr/bin/env bash
#
#
# Ubuntu: Add packages and update config to improve gaming performance
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"

OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" ]] || [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

info() { echo -e "\033[36m==> Linux Gaming Setup: $1\033[0m"; }

info 'Starting script'

info 'Requesting Sudo'

sudo -v

if [[ "$OS_NAME" == "Ubuntu" ]]; then
  info 'Ubuntu - Install supporting APT packages'

  sudo apt update >/dev/null 2>&1
  sudo apt -qq --assume-yes install \
    cmake \
    systemd \
    libsystemd-dev \
    systemd-dev \
    pkg-config \
    meson \
    libsystemd-dev \
    pkg-config \
    ninja-build \
    git \
    dbus-user-session \
    libdbus-1-dev \
    libinih-dev \
    build-essential \
    dkms \
    curl \
    cabextract \
    cpufrequtils >/dev/null 2>&1

  info 'Ubuntu - Set CPU cores to performance mode'

  sudo cpupower frequency-set -g performance >/dev/null 2>&1
  echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils >/dev/null 2>&1
  sudo systemctl restart cpufrequtils >/dev/null 2>&1

  info 'Ubuntu - Increase shader size for Nvidia GPUs'

  export __GL_SHADER_DISK_CACHE_SIZE=10000000000

  info 'Ubuntu - Disable mouse pointer accelleration'

  xset m 0 0

  info 'Ubuntu - Disable Gnome UI animations'

  gsettings set org.gnome.desktop.interface enable-animations false

  info 'Ubuntu - Installing Steam'

  sudo dpkg --add-architecture i386 >/dev/null 2>&1
  sudo apt update >/dev/null 2>&1
  sudo apt -qq --assume-yes install libnvidia-gl-595:i386 >/dev/null 2>&1
  sudo snap install steam
elif [[ "$OS_NAME" == "Fedora Linux" ]]; then
  info 'Fedora - Disable mouse pointer accelleration'

  gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
  gsettings set org.gnome.desktop.peripherals.touchpad accel-profile 'flat'

  info 'Fedora - Update mouse pointer speed'

  gsettings set org.gnome.desktop.peripherals.mouse speed '0.16049382716049387'

  info 'Fedora - Disabling natural scrolling'

  gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false

  info 'Fedora - Disable Gnome UI animations'

  gsettings set org.gnome.desktop.interface enable-animations false

  info 'Fedora - Installing Steam'

  sudo dnf upgrade --refresh
  sudo dnf install -y fedora-workstation-repositories
  sudo dnf install -y steam --enablerepo=rpmfusion-nonfree-steam
fi

info 'Setup Gamemode'

rm -rf "$HOME/.gamemode"
git clone --quiet "https://github.com/FeralInteractive/gamemode.git" "$HOME/.gamemode"
cd "$HOME/.gamemode"
git checkout --quiet 1.8.2

yes | bash "./bootstrap.sh" >/dev/null 2>&1

sudo usermod -aG gamemode $(whoami)

touch "$HOME/.config/gamemode.ini"
cp "$HOME/.config/gamemode.ini" "$HOME/.config/gamemode.ini.old"
cp "$THIS_DIR/gamemode.ini" "$HOME/.config/gamemode.ini"

info 'Installing Discord via Flatpak'

flatpak install --reinstall -y com.discordapp.Discord

info 'Installing Lutris via Flatpak'

flatpak install --reinstall -y net.lutris.Lutris

info 'Installing ProtonPlus via Flatpak'

flatpak install --reinstall -y com.vysp3r.ProtonPlus

info 'Installing Solaar via Flatpak'

flatpak install --reinstall -y io.github.pwr_solaar.solaar

info 'Clearing Flatpak cache and updating Flatpak apps'

rm -rf "$HOME/.cache/flatpak"
mkdir -p "$HOME/.cache/flatpak"

flatpak update -y

info 'Installing for Xbox Controllers firmware'

git clone --quiet https://github.com/medusalix/xone ~/.xone
cd ~/.xone
sudo ./install.sh --release
sudo xone-get-firmware.sh

info 'Done, a system reboot is recommended'
