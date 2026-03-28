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

info '==> dotfiles: start'
chmod +x "$THIS_DIR/setup/"*.sh

info '==> dotfiles: linux/bash/bash.sh'
bash "$THIS_DIR/bash/bash.sh"

info '==> dotfiles: linux/setup/pacman.sh'
bash "$THIS_DIR/setup/pacman.sh"

info '==> dotfiles: linux/setup/apt.sh'
bash "$THIS_DIR/setup/apt.sh"

info '==> dotfiles: linux/setup/snap.sh'
bash "$THIS_DIR/setup/snap.sh"

info '==> dotfiles: linux/setup/flatpak.sh'
bash "$THIS_DIR/setup/flatpak.sh"

info '==> dotfiles: linux/setup/gnome.sh'
bash "$THIS_DIR/setup/gnome.sh"

info '==> dotfiles: linux/setup/homebrew.sh'
bash "$THIS_DIR/setup/homebrew.sh"

info '==> dotfiles: just/setup.sh'
bash "$REPO_DIR/just/setup.sh"

info '==> dotfiles: ghostty/setup.sh'
bash "$REPO_DIR/ghostty/setup.sh"

info '==> dotfiles: linux/vim/vim.sh'
bash "$THIS_DIR/vim/vim.sh"

info '==> dotfiles: linux/tmux/tmux.sh'
bash "$THIS_DIR/tmux/tmux.sh"

info '==> dotfiles: linux/setup/docker.sh'
bash "$THIS_DIR/setup/docker.sh"

info '==> dotfiles: finished, a system reboot is required'
