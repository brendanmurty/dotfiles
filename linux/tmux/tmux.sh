#!/usr/bin/env bash
#
#
# Tmux setup
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

if [[ "$OS_NAME" == "Ubuntu" ]]; then
  sudo apt -y install tmux python3 pipx
fi

brew install tpm

touch "$HOME/.tmux.conf"
cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.old"
cp "$DIR/.tmux.conf" "$HOME/.tmux.conf"
