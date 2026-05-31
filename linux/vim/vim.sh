#!/usr/bin/env bash
#
#
# Vim setup
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $BIN/os-name.sh)"

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

rm -rf "$HOME/.vim.old"

mkdir -p "$HOME/.vim"
cp -r "$HOME/.vim" "$HOME/.vim.old"
rm -rf "$HOME/.vim"

git clone "https://github.com/flazz/vim-colorschemes.git" "$HOME/.vim"

touch "$HOME/.vimrc"

cp "$HOME/.vimrc" "$HOME/.vimrc.old"
cp "$DIR/.vimrc" "$HOME/.vimrc"
