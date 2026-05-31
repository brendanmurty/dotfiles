#!/usr/bin/env bash
#
#
# Homebrew Linux: Install to user dir
#   - Installs Homebrew for Linux, based on docs from https://docs.brew.sh/Homebrew-on-Linux
#   - Assumes use of the Bash Shell
#   - Then moves this install '~/.brew' instead
#
#

BIN="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $BIN/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

BREW_DIR_DEFAULT='/home/linuxbrew'
BREW_DIR="$HOME/.brew"

echo "Homebrew setup script requires 'sudo', prompting for password"
sudo -v
if [ $? -ne 0 ]; then
  echo "Request for sudo privileges failed, exiting"
  exit 0
fi

sudo rm -rf "$BREW_DIR_DEFAULT/.linuxbrew"
sudo rm -rf "$BREW_DIR"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo mv "$BREW_DIR_DEFAULT/.linuxbrew" "$BREW_DIR"
sudo chown -R "$USER:$USER" "$BREW_DIR"
sudo rm -rf "$BREW_DIR_DEFAULT"

eval "$($BREW_DIR/bin/brew shellenv bash)"

echo 'Installing GCC via Homebrew'

brew install gcc

if [[ "$OS_NAME" == "Fedora" ]]; then
  echo 'Fedora: Installing development-tools package'
  sudo dnf group install -y development-tools
fi

echo 'Installing Bold Brew (bbrew)'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Valkyrie00/bold-brew/main/install.sh)"
