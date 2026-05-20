#!/usr/bin/env bash
#
#
# Setup Ghostty terminal emulator - https://github.com/ghostty-org/ghostty
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

CONFIG_DIR="$HOME"
CONFIG_FILE="$THIS_DIR/config.linux.ghostty"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 0
fi

echo 'Requesting sudo'

sudo -v

if [[ "$OS_NAME" == "macOS" ]]; then
  CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"

  mkdir -p "$CONFIG_DIR"
  CONFIG_FILE="$THIS_DIR/config.macos.ghostty"

  # From https://ghostty.org/docs/install/binary#macos
  brew install --cask ghostty
else
  if [[ "$OS_NAME" == "Ubuntu" ]]; then
    # From https://ghostty.org/docs/install/binary#ubuntu
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
  elif [[ "$OS_NAME" == "Fedora" ]]; then
    # From https://ghostty.org/docs/install/binary#fedora
    sudo dnf copr enable scottames/ghostty
    sudo dnf install ghostty -y
  fi

  # Otherwise, assume this is a Linux machine that already has Ghostty installed

  # Figure out the config file directory - from https://ghostty.org/docs/config
  CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
  mkdir -p "$CONFIG_DIR"
fi

echo "Making a backup of '$CONFIG_DIR/config.ghostty'"

touch "$CONFIG_DIR/config.ghostty"
cp "$CONFIG_DIR/config.ghostty" "$CONFIG_DIR/config.ghostty.old"

echo "Copying '$CONFIG_FILE' to '$CONFIG_DIR/config.ghostty'"

cp "$CONFIG_FILE" "$CONFIG_DIR/config.ghostty"
