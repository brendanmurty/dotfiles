#!/usr/bin/env bash
#
#
# Vim setup
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
elif [[ "$OS_NAME" == "Ubuntu" ]]; then
  sudo apt -y install vim
  sudo select-editor
  sudo update-alternatives --config editor
elif [[ "$OS_NAME" == "EndeavourOS" ]]; then
  sudo pacman -Syu
  sudo pacman -S vim
  echo 'export EDITOR=vim' >> "$HOME/.bashrc"
fi

mkdir -p "$HOME/.vim"
rm -rf "$HOME/.vim.before-dotfiles.bak"
mv "$HOME/.vim" "$HOME/.vim.before-dotfiles.bak"

mkdir -p "$HOME/.vim"
git clone "https://github.com/flazz/vim-colorschemes.git" "~/.vim"

touch "$HOME/.vimrc"

cp "$HOME/.vimrc" "$HOME/.vimrc.before-dotfiles.bak"
cp "./.vimrc" "$HOME/.vimrc"
