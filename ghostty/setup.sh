#!/usr/bin/env bash
#
#
# Setup Ghostty terminal emulator - https://github.com/ghostty-org/ghostty
#
#

sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu

sudo apt -qq update

sudo apt install -qq --assume-yes ghostty

echo "Copying 'ghostty.txt' to '$HOME/config.ghostty'"

touch "$HOME/config.ghostty"
cp "$HOME/config.ghostty" "$HOME/config.ghostty.before-dotfiles.bak"

cp "$THIS_DIR/ghostty.txt" "$HOME/config.ghostty"
