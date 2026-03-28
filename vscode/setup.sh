#!/usr/bin/env bash
#
#
# VS Code setup and install packages
#   - The package list can be updated with: code --list-extensions > "./vscode.extensions.txt"
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"

# Install all packages from the package list file in this dir

xargs -a "$DIR/vscode.extensions.txt" code --install-extension
