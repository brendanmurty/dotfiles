#!/usr/bin/env bash
#
#
# Setup Ghostty terminal emulator - https://github.com/ghostty-org/ghostty
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
LIB="$(cd "$(dirname "$0")" && cd ../lib && pwd)"
OS_NAME="$(bash $LIB/get-os-name.sh)"

CONFIG_DIR="$HOME"
CONFIG_FILE="linux-ghostty.txt"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 0
fi

if [[ "$OS_NAME" == "macOS" ]]; then
  CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"

  mkdir -p "$CONFIG_DIR"
  CONFIG_FILE="macos-ghostty.txt"

  brew install --cask ghostty
else
  if [[ "$OS_NAME" == "Ubuntu" ]]; then
    sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu
    sudo apt -qq update
    sudo apt install -qq --assume-yes ghostty
  fi

  # Otherwise, assume this is a Linux machine that already has Ghostty installed

  # Figure out the config file directory - from https://ghostty.org/docs/config
  CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
fi

echo "Making a backup of '$CONFIG_DIR/config.ghostty'"

touch "$CONFIG_DIR/config.ghostty"
cp "$CONFIG_DIR/config.ghostty" "$CONFIG_DIR/config.ghostty.before-dotfiles.bak"

echo "Copying '$CONFIG_FILE' to '$CONFIG_DIR/config.ghostty'"

cp "$THIS_DIR/$CONFIG_FILE" "$CONFIG_DIR/config.ghostty"
