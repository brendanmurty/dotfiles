#!/usr/bin/env bash
#
#
# Linux: Setup system
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

info() { echo -e "\033[36m$1\033[0m"; }

info '==> dotfiles: start linux setup'

info '==> dotfiles: linux/bash/bash.sh'
bash "$REPO_DIR/linux/bash/bash.sh"

info '==> dotfiles: git/git.sh'
bash "$REPO_DIR/git/git.sh"

info '==> dotfiles: linux/linux-flatpak.sh'
bash "$REPO_DIR/linux/linux-flatpak.sh"

info '==> dotfiles: linux/gnome/gnome.sh'
bash "$REPO_DIR/linux/gnome/gnome.sh"

info '==> dotfiles: linux/hardware/keychron-keyboards.sh'
bash "$REPO_DIR/linux/hardware/keychron-keyboards.sh"

info '==> dotfiles: linux/hardware/bluetooth-fixes.sh'
bash "$REPO_DIR/linux/hardware/bluetooth-fixes.sh"

info '==> dotfiles: scripts/homebrew/homebrew-setup-user.linux.sh'
bash "$REPO_DIR/scripts/homebrew/homebrew-setup-user.linux.sh"

info '==> dotfiles: just/just.sh'
bash "$REPO_DIR/just/just.sh"

info '==> dotfiles: ghostty/ghostty.sh'
bash "$REPO_DIR/ghostty/ghostty.sh"

info '==> dotfiles: linux/vim/vim.sh'
bash "$REPO_DIR/linux/vim/vim.sh"

info '==> dotfiles: linux/tmux/tmux.sh'
bash "$REPO_DIR/linux/tmux/tmux.sh"

info '==> dotfiles: linux/linux-google-chrome.sh'
bash "$REPO_DIR/linux/linux-google-chrome.sh"

info '==> dotfiles: dropbox/maestral/maestral.sh'
bash "$REPO_DIR/dropbox/maestral/maestral.sh"

info '==> dotfiles: docker/docker.sh'
bash "$REPO_DIR/docker/docker.sh"

info '==> dotfiles: finished linux setup, a system reboot is recommended'
