#!/usr/bin/env bash
#
#
# Vim setup
#
#

DOTFILES_LINUX_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

sudo apt -y install vim

sudo select-editor
sudo update-alternatives --config editor

mkdir -p "$HOME/.vim"
cp -r "$HOME/.vim" "$HOME/.vim.before-dotfiles.bak"
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim

touch "$HOME/.vimrc"
cp "$HOME/.vimrc" "$HOME/.vimrc.before-dotfiles.bak"
cp "$DOTFILES_LINUX_DIR/config/vimrc.txt" "$HOME/.vimrc"
