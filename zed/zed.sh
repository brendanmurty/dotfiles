#!/usr/bin/env bash
#
#
# Setup Zed editor - https://zed.dev/
#
#

THIS_DIR="$(cd "${BASH_SOURCE[0]%/*}" && pwd -P)"
SCRIPTS="$(cd "${BASH_SOURCE[0]%/*}/../scripts" && pwd -P)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

CONFIG_DIR="$HOME/.config/zed"
CONFIG_FILE="$THIS_DIR/settings.json"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 0
fi

echo 'Requesting sudo'

sudo -v

if [[ "$OS_NAME" == "macOS" ]]; then
  brew reinstall --cask zed
  brew reinstall shellcheck

  CONFIG_DIR="$HOME/.zed"
else
  sudo apt-get install shellcheck
  flatpak uninstall dev.zed.Zed
  curl -f https://zed.dev/install.sh | sh
fi

mkdir -p "$CONFIG_DIR"

echo "Making a backup of '$CONFIG_DIR/settings.json'"

touch "$CONFIG_DIR/settings.json"
cp "$CONFIG_DIR/settings.json" "$CONFIG_DIR/settings.json.old"

echo "Copying '$CONFIG_FILE' to '$CONFIG_DIR/settings.json'"

cp "$CONFIG_FILE" "$CONFIG_DIR/settings.json"

echo "Finished Zed setup"

if [[ "$OS_NAME" == "macOS" ]]; then
  echo "On macOS, you need to manually install the Zed CLI tool: https://zed.dev/docs/macos#installing-the-cli"
fi
