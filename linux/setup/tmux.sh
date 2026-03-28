#!/usr/bin/env bash
#
#
# Tmux setup
#
#

PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

if [[ "$OS_NAME" == "Ubuntu" ]]; then
  sudo apt -y install tmux python3 pipx
fi

brew install tpm

touch "$HOME/.tmux.conf"
cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.before-dotfiles.bak"
cp "$PARENT_DIR/config/.tmux.conf" "$HOME/.tmux.conf"
