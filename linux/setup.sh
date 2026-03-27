#!/usr/bin/env bash
#
#
# Linux: Setup packages and config
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $THIS_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "These scripts require Linux."
  exit 0
fi

info() { echo -e "\033[36m$1\033[0m"; }

chmod +x "$THIS_DIR/setup/"*.sh

info 'endeavouros: setup'
bash "$THIS_DIR/setup/endeavouros.sh"

info 'apt: update, upgrade and install'
bash "$THIS_DIR/setup/apt.sh"

info 'snap: setup'
bash "$THIS_DIR/setup/snap.sh"

info 'flatpak: setup'
bash "$THIS_DIR/setup/flatpak.sh"

info 'gnome: setup'
bash "$THIS_DIR/setup/gnome.sh"

info 'bash: setup'
bash "$THIS_DIR/setup/bash.sh"

info 'homebrew: setup'
bash "$THIS_DIR/setup/homebrew.sh"

info 'just: setup'
bash "$REPO_DIR/just/setup.sh"

info 'ghostty: setup'
bash "$REPO_DIR/ghostty/setup.sh"

info 'vim: setup'
bash "$THIS_DIR/setup/vim.sh"

info 'tmux: setup'
bash "$THIS_DIR/setup/tmux.sh"

info 'docker: setup'
bash "$THIS_DIR/setup/docker.sh"

info 'done: a system reboot is required'
