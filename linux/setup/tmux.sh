#!/usr/bin/env bash
#
#
# Tmux setup
#
#

DOTFILES_LINUX_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

sudo apt -y install tmux python3 pipx

brew install tpm

touch "$HOME/.tmux.conf"
cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.before-dotfiles.bak"
cp "$DOTFILES_LINUX_DIR/config/tmux.txt" "$HOME/.tmux.conf"
