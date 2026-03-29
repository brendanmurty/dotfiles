#!/usr/bin/env bash
#
#
# Linux: Setup system
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $THIS_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

info() { echo -e "\033[36m$1\033[0m"; }

info '==> dotfiles: start linux setup'

info '==> dotfiles: bash/bash.sh'
bash "$REPO_DIR/bash/bash.sh"

info '==> dotfiles: git/git.sh'
bash "$REPO_DIR/git/git.sh"

info '==> dotfiles: scripts/flatpak-setup.linux.sh'
bash "$REPO_DIR/scripts/flatpak-setup.linux.sh"

info '==> dotfiles: scripts/gnome-setup.linux.sh'
bash "$REPO_DIR/scripts/gnome-setup.linux.sh"

info '==> dotfiles: scripts/keychron-keyboards.linux.sh'
bash "$REPO_DIR/scripts/keychron-keyboards.linux.sh"

info '==> dotfiles: scripts/homebrew-setup-user.linux.sh'
bash "$REPO_DIR/scripts/homebrew-setup-user.linux.sh"

info '==> dotfiles: just/just.sh'
bash "$REPO_DIR/just/just.sh"

info '==> dotfiles: ghostty/ghostty.sh'
bash "$REPO_DIR/ghostty/ghostty.sh"

info '==> dotfiles: vim/vim.sh'
bash "$REPO_DIR/vim/vim.sh"

info '==> dotfiles: tmux/tmux.sh'
bash "$REPO_DIR/tmux/tmux.sh"

info '==> dotfiles: docker/docker.sh'
bash "$REPO_DIR/docker/docker.sh"

info '==> dotfiles: finished linux setup, a system reboot is recommended'
