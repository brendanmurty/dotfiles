#!/usr/bin/env bash
#
#
# Setup 'just' command runner for the current user
#   - Requires Homebrew (Linux or macOS) to be installed first: https://brew.sh/
#   - Installs 'just', adds a 'run' alias to run the commands from 'justfile' in this dir
#   - Then you can run from any directory (lists all options): run
#   - More info at https://github.com/casey/just
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

echo 'Installing "just" via Homebrew'

brew install just

echo "Adding 'run' alias to '$HOME/.bash_aliases'"

touch "$HOME/.bash_aliases"
echo "alias run='just --justfile ${THIS_DIR}/justfile'" >> "$HOME/.bash_aliases"

source "$HOME/.bash_aliases"

echo "Finished. You may need to restart your Terminal before the 'ujust' command works."
