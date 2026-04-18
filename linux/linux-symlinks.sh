#!/usr/bin/env bash
#
#
# Symlinks setup
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

ln -s "$REPO_DIR" "$HOME/Dotfiles"
