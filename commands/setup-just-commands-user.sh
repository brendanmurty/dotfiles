#!/usr/bin/env bash
#
#
# Setup 'just' command runner for the current user
#   - Requires Homebrew (Linux or macOS) to be installed first: https://brew.sh/
#   - Installs 'just', adds a 'ujust' alias to run the commands from 'justfile' in this dir
#   - Then you can run from any directory (lists all options): ujust
#   - More info at https://github.com/casey/just
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

echo 'Installing "just" via Homebrew'

brew install just

echo "Adding 'ujust' alias to '$HOME/.bash_aliases'"

touch "$HOME/.bash_aliases"

echo "alias ujust='just --justfile ${THIS_DIR}/justfile'" >> "$HOME/.bash_aliases"

source "$HOME/.bash_aliases"

echo "Finished. You may need to restart your Terminal before the 'ujust' command works."
