#!/usr/bin/env bash
#
#
# Setup Ghostty terminal emulator - https://github.com/ghostty-org/ghostty
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $(uname) == "Darwin" ]]; then
  # This is a macOS machine
  brew install --cask ghostty
else
  # Otherwise, assume this is a Linux machine using APT
  sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu
  sudo apt -qq update
  sudo apt install -qq --assume-yes ghostty
fi

echo "Copying 'ghostty.txt' to '$HOME/config.ghostty'"

touch "$HOME/config.ghostty"
cp "$HOME/config.ghostty" "$HOME/config.ghostty.before-dotfiles.bak"

cp "$THIS_DIR/ghostty.txt" "$HOME/config.ghostty"
