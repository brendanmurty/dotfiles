#!/usr/bin/env bash
#
#
# Linux: Setup packages and config
#   - Tested on Ubuntu 24
#
#

info() { echo -e "\033[36m$1\033[0m"; }

info 'apt: update, upgrade and install'
bash './setup/apt.sh' >/dev/null 2>&1

info 'snap: setup'
bash './setup/snap.sh' >/dev/null 2>&1

info 'flatpak: setup'
bash './setup/flatpak.sh' >/dev/null 2>&1

info 'gnome: setup'
bash './setup/gnome.sh' >/dev/null 2>&1

info 'bash: setup'
bash './setup/bash.sh' >/dev/null 2>&1

info 'homebrew: setup'
bash './setup/homebrew.sh' >/dev/null 2>&1

info 'vim: setup'
bash './setup/vim.sh' >/dev/null 2>&1

info 'tmux: setup'
bash './setup/tmux.sh' >/dev/null 2>&1

info 'docker: setup'
bash './setup/docker.sh' >/dev/null 2>&1

info 'done: a system reboot is required'
