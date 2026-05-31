#!/usr/bin/env bash
#
#
# Setup VS Code - https://code.visualstudio.com/
#   - The package list can be updated with: code --list-extensions > "./vscode.extensions.txt"
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS="$(bash $BIN/os.sh)"

# Default to a standard install on a Linux system
CONFIG_DIR="$HOME/.config/Code/User"
INSTALL_CMD="code --install-extension"

# Update thes
if [[ "$OS" == "macOS" ]]; then
  # macOS system
  CONFIG_DIR="$HOME/.config/Code/User"
elif [[ "$OS" == "Windows" ]]; then
  # Windows system
  CONFIG_DIR="$APPDATA\Code\User"
elif [ -d "$HOME/.var/app/com.visualstudio.code" ]; then
  # Linux system with VS Code installed via Flatpak
  CONFIG_DIR="$HOME/.var/app/com.visualstudio.code/config/Code/User"
  INSTALL_CMD="flatpak run com.visualstudio.code --install-extension"
fi

mkdir -p "$CONFIG_DIR"

# Backup current config, copy over custom config

mv "$CONFIG_DIR/settings.json" "$CONFIG_DIR/settings.json.bak"
cp "$DIR/settings.json" "$CONFIG_DIR/settings.json"

# Install all packages from the package list file in this dir

cat "$DIR/vscode.extensions.txt" | while read extension
do
  $INSTALL_CMD $extension
done
