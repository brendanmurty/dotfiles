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

  info 'Ubuntu - Install supporting packages'

  sudo apt update -qq

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

  sudo dpkg --add-architecture i386 > /dev/null 2>&1
  sudo apt update -qq
  sudo apt -qq --assume-yes install libnvidia-gl-595:i386 > /dev/null 2>&1

  STEAM_DEB="$HOME/Downloads/temp-steam_latest.deb"
  rm -rf "$STEAM_DEB"
  curl --output "$STEAM_DEB" "https://repo.steampowered.com/steam/archive/precise/steam_latest.deb" > /dev/null 2>&1
  sudo apt -qq --assume-yes install "$STEAM_DEB"
  rm -rf "$STEAM_DEB"

elif [[ "$OS_NAME" == "Fedora Linux" ]]; then

  info 'Fedora - Install supporting packages'

  sudo dnf install -y dkms kernel-devel kernel-headers cabextract steam-devices screenfetch

  info 'Fedora - Disable mouse pointer accelleration'

  gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
  gsettings set org.gnome.desktop.peripherals.touchpad accel-profile 'flat'

  info 'Fedora - Update mouse pointer speed'

  gsettings set org.gnome.desktop.peripherals.mouse speed '0.4897119341563787'

  info 'Fedora - Disabling natural scrolling'

  gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false

  info 'Fedora - Disable Gnome UI animations'

  gsettings set org.gnome.desktop.interface enable-animations false

  if [ -n "$(lspci | grep -i nvidia)" ]; then

    info 'Fedora - Setup for Nvidia graphics card'

    sudo dnf install -y "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    sudo dnf install -y "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

    sudo dnf install -y nvidia-smi akmod-nvidia xorg-x11-drv-nvidia-cuda kernel-devel-matched kernel-headers

    sudo akmods --force
    sudo dracut --force

  fi

  info 'Fedora - Installing Steam'

  flatpak install --reinstall -y com.valvesoftware.Steam
  flatpak override --user --env=__GL_CONSTANT_FRAME_RATE_HINT=3 com.valvesoftware.Steam

  info 'Fedora - Running Steam in the background to run dependency installs'

  nohup flatpak run com.valvesoftware.Steam &

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

rm -rf "$HOME/.xone"
git clone --quiet "https://github.com/medusalix/xone" "$HOME/.xone"
cd "$HOME/.xone"
sudo "./install.sh" --release
sudo "xone-get-firmware.sh"

info 'Done, a system reboot is required'
