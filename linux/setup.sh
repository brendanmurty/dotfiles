#!/usr/bin/env bash
#
#
# Linux: Setup packages and config
#   - Tested on Ubuntu 24
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

info() { echo -e "\033[36m$1\033[0m"; }

chmod +x "$THIS_DIR/setup/"*.sh

info 'apt: update, upgrade and install'
bash "$THIS_DIR/setup/apt.sh" >/dev/null 2>&1

info 'snap: setup'
bash "$THIS_DIR/setup/snap.sh" >/dev/null 2>&1

info 'flatpak: setup'
bash "$THIS_DIR/setup/flatpak.sh" >/dev/null 2>&1

info 'gnome: setup'
bash "$THIS_DIR/setup/gnome.sh" >/dev/null 2>&1

info 'bash: setup'
bash "$THIS_DIR/setup/bash.sh" >/dev/null 2>&1

info 'homebrew: setup'
bash "$THIS_DIR/setup/homebrew.sh" >/dev/null 2>&1

info 'just: setup'
bash "$REPO_DIR/just/setup.sh" >/dev/null 2>&1

info 'ghostty: setup'
bash "$REPO_DIR/ghostty/setup.sh" >/dev/null 2>&1

info 'vim: setup'
bash "$THIS_DIR/setup/vim.sh" >/dev/null 2>&1

info 'tmux: setup'
bash "$THIS_DIR/setup/tmux.sh" >/dev/null 2>&1

info 'docker: setup'
bash "$THIS_DIR/setup/docker.sh" >/dev/null 2>&1

info 'done: a system reboot is required'
