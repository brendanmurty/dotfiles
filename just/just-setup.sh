#!/usr/bin/env bash
#
#
# Setup 'just' command runner for the current user
#   - Requires Homebrew (Linux or macOS) to be installed first: https://brew.sh/
#   - Installs 'just'
#   - Adds a 'j' alias to run the commands from the file named 'justfile' in this dir
#   - You may need to restart your Terminal before 'just' and the 'j' alias commands work properly
#   - Then you can run from any directory (lists all options if no params set): j
#   - More info at https://github.com/casey/just
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing 'just' via Homebrew"

brew install just

echo "Adding 'j' alias to '$HOME/.bash_aliases'"

touch "$HOME/.bash_aliases"

echo "" >> "$HOME/.bash_aliases"
echo "alias j='just --justfile ${THIS_DIR}/justfile'" >> "$HOME/.bash_aliases"

source "$HOME/.bash_aliases"
