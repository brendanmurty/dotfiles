#!/usr/bin/env bash
#
#
# Setup Ghostty terminal emulator - https://github.com/ghostty-org/ghostty
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

CONFIG_DIR="$HOME"

if [[ $(uname) == "Darwin" ]]; then
  # This is a macOS machine
  CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
  mkdir -p "$CONFIG_DIR"
  brew install --cask ghostty
else
  # Otherwise, assume this is a Linux machine using APT
  sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu
  sudo apt -qq update
  sudo apt install -qq --assume-yes ghostty
fi

echo "Making a backup of '$CONFIG_DIR/config.ghostty'"

touch "$CONFIG_DIR/config.ghostty"
cp "$CONFIG_DIR/config.ghostty" "$CONFIG_DIR/config.ghostty.before-dotfiles.bak"

echo "Copying 'ghostty.txt' to '$CONFIG_DIR/config.ghostty'"

cp "$THIS_DIR/ghostty.txt" "$CONFIG_DIR/config.ghostty"
