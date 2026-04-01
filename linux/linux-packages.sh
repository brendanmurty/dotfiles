#!/usr/bin/env bash
#
#
# Linux: Install packages
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

info '==> dotfiles: start linux packages install'
chmod +x "$THIS_DIR/packages/"*.sh

info '==> dotfiles: linux/packages/pacman.sh'
bash "$THIS_DIR/packages/pacman.sh"

info '==> dotfiles: linux/packages/apt.sh'
bash "$THIS_DIR/packages/apt.sh"

info '==> dotfiles: linux/packages/snap.sh'
bash "$THIS_DIR/packages/snap.sh"

info '==> dotfiles: linux/packages/flatpak.sh'
bash "$THIS_DIR/packages/flatpak.sh"

info '==> dotfiles: linux/packages/homebrew.sh'
bash "$THIS_DIR/packages/homebrew.sh"

info '==> dotfiles: linux/packages/gnome-shell-extensions.sh'
bash "$THIS_DIR/packages/gnome-shell-extensions.sh"

info '==> dotfiles: finished linux packages install, a system reboot is recommended'
