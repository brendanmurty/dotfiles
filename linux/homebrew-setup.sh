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

BREW_DIR_DEFAULT='/home/linuxbrew/.linuxbrew'
BREW_DIR="$HOME/.brew"

sudo rm -rf "$BREW_DIR_DEFAULT"
sudo rm -rf "$BREW_DIR"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo mv "$BREW_DIR_DEFAULT" "$BREW_DIR"
sudo chown -R "$USER:$USER" "$BREW_DIR"

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
echo 'export PATH="$PATH:$BREW_DIR/bin"' >> "$HOME/.bash_profile"

source "$HOME/.bash_profile"

brew install gcc
