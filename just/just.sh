#!/usr/bin/env bash
#
#
# Setup 'just' command runner for the current user
#   - Requires Homebrew (Linux or macOS) to be installed first: https://brew.sh/
#   - Installs 'just'
#   - Copies the 'justfile' from this dir to your user dir
#   - You may need to restart your Terminal before 'just' command work properly
#   - Then you can run from any directory inside of your user dir: just
#   - More info at https://github.com/casey/just
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing 'just' via Homebrew"

brew install just

echo "Copying 'justfile' to '$HOME/justfile'"

touch "$HOME/justfile"
cp "$HOME/justfile" "$HOME/justfile.old"

cp "$THIS_DIR/justfile" "$HOME/justfile"
