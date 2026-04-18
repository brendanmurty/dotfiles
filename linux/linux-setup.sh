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

info() { echo -e "\033[36m==> Linux Setup: $1\033[0m"; }

info 'start linux setup'

info 'requesting sudo access'

sudo -v

info 'linux/bash/bash-setup.sh'
bash "$REPO_DIR/linux/bash/bash-setup.sh"

info 'linux/linux-symlinks.sh'
bash "$REPO_DIR/linux/linux-symlinks.sh"

info 'fonts/fonts-setup.sh'
bash "$REPO_DIR/fonts/fonts-setup.sh"

info 'git/git-setup.sh'
bash "$REPO_DIR/git/git-setup.sh"

info 'linux/linux-flatpak.sh'
bash "$REPO_DIR/linux/linux-flatpak.sh"

info 'linux/gnome/gnome.sh'
bash "$REPO_DIR/linux/gnome/gnome.sh"

info 'linux/hardware/keychron-keyboards.sh'
bash "$REPO_DIR/linux/hardware/keychron-keyboards.sh"

info 'linux/hardware/bluetooth-fixes.sh'
bash "$REPO_DIR/linux/hardware/bluetooth-fixes.sh"

info 'scripts/homebrew/homebrew-setup-user.linux.sh'
bash "$REPO_DIR/scripts/homebrew/homebrew-setup-user.linux.sh"

info 'just/just-setup.sh'
bash "$REPO_DIR/just/just-setup.sh"

info 'ghostty/ghostty.sh'
bash "$REPO_DIR/ghostty/ghostty.sh"

info 'linux/vim/vim.sh'
bash "$REPO_DIR/linux/vim/vim.sh"

info 'linux/tmux/tmux.sh'
bash "$REPO_DIR/linux/tmux/tmux.sh"

info 'linux/linux-google-chrome.sh'
bash "$REPO_DIR/linux/linux-google-chrome.sh"

info 'docker/docker.sh'
bash "$REPO_DIR/docker/docker.sh"

info 'finished linux setup, a system reboot is recommended'
