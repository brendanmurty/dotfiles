#!/usr/bin/env bash
#
#
# Tmux setup
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS="$(bash $BIN/os.sh)"

if [[ "$OS" == "macOS" || "$OS" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

if [[ "$OS" == "Ubuntu" ]]; then
  sudo apt -y install tmux python3 pipx
fi

brew install tpm

touch "$HOME/.tmux.conf"
cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.old"
cp "$DIR/.tmux.conf" "$HOME/.tmux.conf"
