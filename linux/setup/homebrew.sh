#!/usr/bin/env bash
#
#
# Homebrew setup
#   - Installs Homebrew for Linux, based on docs from https://docs.brew.sh/Homebrew-on-Linux
#   - Assumes use of the Bash Shell
#   - Then moves this install '~/.brew' instead
#   - Installs the 'gcc' Homebrew package
#
#

LIB="$(cd "$(dirname "$0")" && cd ../lib && pwd)"
OS_NAME="$(bash $LIB/get-os-name.sh)"

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

touch "$HOME/.bashrc"

echo "" >> "$HOME/.bashrc"
echo "# Setup user-level Homebrew if it's installed there" >> "$HOME/.bashrc"
echo "" >> "$HOME/.bashrc"
echo 'BREW_DIR="$HOME/.brew"' >> "$HOME/.bashrc"
echo 'if [ -d "$BREW_DIR" ]; then' >> "$HOME/.bashrc"
echo '  export HOMEBREW_RELOCATE_BUILD_PREFIX="$BREW_DIR"' >> "$HOME/.bashrc"
echo '  export HOMEBREW_CELLAR="$BREW_DIR/Cellar"' >> "$HOME/.bashrc"
echo '  export HOMEBREW_PREFIX="$BREW_DIR"' >> "$HOME/.bashrc"
echo '  export HOMEBREW_NO_ENV_HINTS=1' >> "$HOME/.bashrc"
echo '  export HOMEBREW_NO_UPDATE_REPORT_FORMULAE=1' >> "$HOME/.bashrc"
echo '  export HOMEBREW_NO_UPDATE_REPORT_CASKS=1' >> "$HOME/.bashrc"
echo '  eval "$($BREW_DIR/bin/brew shellenv bash)"' >> "$HOME/.bashrc"
echo '  alias brew="$BREW_DIR/bin/brew"' >> "$HOME/.bashrc"
echo 'fi' >> "$HOME/.bashrc"

eval "$($BREW_DIR/bin/brew shellenv bash)"

if [[ "$OS_NAME" == "Ubuntu" ]]; then
  sudo apt-get install build-essential
fi

brew install gcc
