#!/usr/bin/env bash
#
#
# Tmux setup
#   - Tested on Ubuntu 24
#
#

sudo apt -y install tmux

brew install tpm

touch "$HOME/.tmux.conf"
cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.before-dotfiles.bak"
cp "./config/tmux.txt" "$HOME/.tmux.conf"
