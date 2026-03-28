#!/usr/bin/env bash
#
#
# VS Code setup and install packages
#   - The package list can be updated with: code --list-extensions > "./vscode.extensions.txt"
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

# From http://code.visualstudio.com/docs/configure/settings#_settings-file-locations
# Assume this is a Linux system to start
CONFIG_DIR="$HOME/.config/Code/User"
if [[ "$OS_NAME" == "macOS" ]]; then
  # macOS system
  CONFIG_DIR="$HOME/.config/Code/User"
elif [[ "$OS_NAME" == "Windows" ]]; then
  # Windows system
  CONFIG_DIR="$APPDATA\Code\User"
elif [ -d "$HOME/.var/app/com.visualstudio.code" ]; then
  # Linux system with VS Code installed via Flatpak
  CONFIG_DIR="$HOME/.var/app/com.visualstudio.code/config/Code/User"
fi

mkdir -p "$CONFIG_DIR"

# Copy over config after backing up current config

mv "$CONFIG_DIR/settings.json" "$CONFIG_DIR/settings.json.bak"
cp "$DIR/settings.json" "$CONFIG_DIR/settings.json"

# Install all packages from the package list file in this dir

xargs code --install-extension < "$DIR/vscode.extensions.txt"
