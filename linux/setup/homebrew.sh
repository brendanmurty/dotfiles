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

touch "$HOME/.bash_profile"

echo "" >> "$HOME/.bash_profile"
echo "BREW_DIR='$(echo $BREW_DIR)'" >> "$HOME/.bash_profile"

echo 'export HOMEBREW_RELOCATE_BUILD_PREFIX="$BREW_DIR"' >> "$HOME/.bash_profile"
echo 'export HOMEBREW_CELLAR="$BREW_DIR/Cellar"' >> "$HOME/.bash_profile"
echo 'export HOMEBREW_PREFIX="$BREW_DIR"' >> "$HOME/.bash_profile"
echo 'export HOMEBREW_NO_ENV_HINTS=1' >> "$HOME/.bash_profile"
echo 'export HOMEBREW_NO_UPDATE_REPORT_FORMULAE=1' >> "$HOME/.bash_profile"
echo 'export HOMEBREW_NO_UPDATE_REPORT_CASKS=1' >> "$HOME/.bash_profile"

echo 'eval "$($BREW_DIR/bin/brew shellenv)"' >> "$HOME/.bash_profile"
echo 'alias brew="$BREW_DIR/bin/brew"' >> "$HOME/.bash_profile"

# Add Homebrew Bin Dir to PATH variable if it's not already there
if [ -d "$BREW_DIR/bin" ] && [[ ":$PATH:" != *":$BREW_DIR/bin:"* ]]; then
  export PATH="${PATH}:$BREW_DIR/bin:"
fi

source "$HOME/.bash_profile"

brew install gcc
