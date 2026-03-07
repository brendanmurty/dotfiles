#!/usr/bin/env bash
#
#
# Homebrew Linux - Install to user home dir
#   - Assumes use of the Bash Shell
#   - Based on docs from https://docs.brew.sh/Homebrew-on-Linux
#
#

BREW_DIR_DEFAULT='/home/linuxbrew'

BREW_DIR="$HOME/.brew"

sudo rm -rf "$BREW_DIR_DEFAULT"
sudo rm -rf "$BREW_DIR"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo chown -R $USER:$USER "$BREW_DIR_DEFAULT"

sudo mv "$BREW_DIR_DEFAULT" "$BREW_DIR"

echo "BREW_DIR='$(echo $BREW_DIR)'" >> "$HOME/.bashrc"
echo 'export HOMEBREW_RELOCATE_BUILD_PREFIX="$BREW_DIR/.linuxbrew"' >> "$HOME/.bashrc"
echo 'export HOMEBREW_CELLAR="$BREW_DIR/.linuxbrew/Cellar"' >> "$HOME/.bashrc"
echo 'export HOMEBREW_PREFIX="$BREW_DIR/.linuxbrew"' >> "$HOME/.bashrc"
echo 'export HOMEBREW_NO_ENV_HINTS=1' >> "$HOME/.bash_profile"
echo 'eval "$($BREW_DIR/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
echo 'alias brew="$BREW_DIR/.linuxbrew/bin/brew"' >> "$HOME/.bashrc"
echo 'export PATH="$PATH:$BREW_DIR/.linuxbrew/bin"' >> "$HOME/.bashrc"

source "$HOME/.bashrc"

brew install gcc
