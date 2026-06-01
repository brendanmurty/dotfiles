#!/usr/bin/env bash
#
#
# Linux: Setup system
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS="$(bash $REPO_DIR/bin/os.sh)"

if [[ "$OS" == "macOS" || "$OS" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

info() { echo -e "\033[36m==> Linux Setup: $1\033[0m"; }

info 'Requesting sudo access'

sudo -v

info 'Run linux/bash/bash-setup.sh'
bash "$REPO_DIR/linux/bash/bash-setup.sh"

info 'Run fonts/fonts-setup.sh'
bash "$REPO_DIR/fonts/fonts-setup.sh"

info 'Run dev/git/git-setup.sh'
bash "$REPO_DIR/dev/git/git-setup.sh"

info 'Run linux/linux-flatpak.sh'
bash "$REPO_DIR/linux/linux-flatpak.sh"

info 'Run linux/linux-debian.sh'
bash "$REPO_DIR/linux/linux-debian.sh"

info 'Run linux/linux-ubuntu.sh'
bash "$REPO_DIR/linux/linux-ubuntu.sh"

info 'Run linux/linux-fedora.sh'
bash "$REPO_DIR/linux/linux-fedora.sh"

info 'Run linux/hardware/keychron-keyboards.sh'
bash "$REPO_DIR/linux/hardware/keychron-keyboards.sh"

info 'Run linux/hardware/bluetooth-fixes.sh'
bash "$REPO_DIR/linux/hardware/bluetooth-fixes.sh"

info 'Run homebrew/homebrew-setup-user.linux.sh'
bash "$REPO_DIR/homebrew/homebrew-setup-user.linux.sh"

info 'Run just/just-setup.sh'
bash "$REPO_DIR/just/just-setup.sh"

info 'Run linux/vim/vim.sh'
bash "$REPO_DIR/linux/vim/vim.sh"

info 'Run linux/linux-google-chrome.sh'
bash "$REPO_DIR/linux/linux-google-chrome.sh"

info 'Finished, a system reboot is recommended'
