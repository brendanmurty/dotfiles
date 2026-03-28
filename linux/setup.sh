#!/usr/bin/env bash
#
#
# Linux: Setup packages and config
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $THIS_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "These scripts require Linux."
  exit 0
fi

info() { echo -e "\033[36m$1\033[0m"; }

info '==> dotfiles: start'
chmod +x "$THIS_DIR/packages/"*.sh

info '==> dotfiles: bash/bash.sh'
bash "$REPO_DIR/bash/bash.sh"

info '==> dotfiles: linux/packages/pacman.sh'
bash "$THIS_DIR/packages/pacman.sh"

info '==> dotfiles: linux/packages/apt.sh'
bash "$THIS_DIR/packages/apt.sh"

info '==> dotfiles: linux/packages/snap.sh'
bash "$THIS_DIR/packages/snap.sh"

info '==> dotfiles: git/git.sh'
bash "$REPO_DIR/git/git.sh"

info '==> dotfiles: scripts/flatpak-setup.linux.sh'
bash "$REPO_DIR/scripts/flatpak-setup.linux.sh"

info '==> dotfiles: linux/packages/flatpak.sh'
bash "$THIS_DIR/packages/flatpak.sh"

info '==> dotfiles: linux/tweaks/gnome.sh'
bash "$THIS_DIR/tweaks/gnome.sh"

info '==> dotfiles: linux/tweaks/keychron-keyboards.sh'
bash "$THIS_DIR/tweaks/keychron-keyboards.sh"

info '==> dotfiles: scripts/homebrew-setup-user.linux.sh'
bash "$REPO_DIR/scripts/homebrew-setup-user.linux.sh"

info '==> dotfiles: linux/packages/homebrew.sh'
bash "$THIS_DIR/packages/homebrew.sh"

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

info '==> dotfiles: finished, a system reboot is required'
