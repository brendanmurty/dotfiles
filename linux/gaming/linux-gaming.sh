#!/usr/bin/env bash
#
#
# Ubuntu: Add packages and update config to improve gaming performance
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd ../.. && pwd)"

OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

info() { echo -e "\033[36m$1\033[0m"; }

info '==> dotfiles: start linux gaming setup'

info '==> dotfiles: install packages'

sudo apt -qq --assume-yes install \
  meson \
  libsystemd-dev \
  pkg-config \
  ninja-build \
  git \
  dbus-user-session \
  libdbus-1-dev \
  libinih-dev \
  build-essential \
  cpufrequtils

info '==> dotfiles: setup gamemode'

rm -rf "$HOME/.gamemode"
git clone "https://github.com/FeralInteractive/gamemode.git" "$HOME/.gamemode"
cd "$HOME/.gamemode"
bash "./bootstrap.sh"

sudo usermod -aG gamemode $(whoami)

touch "$HOME/.config/gamemode.ini"
cp "$HOME/.config/gamemode.ini" "$HOME/.config/gamemode.ini.old"
cp "$THIS_DIR/gamemode.ini" "$HOME/.config/gamemode.ini"

info '==> dotfiles: update system settings'

# Disable mouse pointer accelleration
xset m 0 0

# Disable Gnome UI animations
gsettings set org.gnome.desktop.interface enable-animations false

# Set CPU to performance mode
sudo cpupower frequency-set -g performance
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl restart cpufrequtils

# Increase shader size for Nvidia GPUs
export __GL_SHADER_DISK_CACHE_SIZE=10000000000

info '==> dotfiles: finished linux gaming setup, a system reboot is required'
