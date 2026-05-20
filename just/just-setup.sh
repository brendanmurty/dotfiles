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

DIR="$(cd "$(dirname "$0")" && pwd)"

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo 'Linux or macOS is required'
  exit 1
fi

echo "Installing 'fzf' and 'just' via Homebrew"

brew reinstall fzf --force >/dev/null 2>&1
brew reinstall just --force >/dev/null 2>&1

echo "Adding symlink: '$HOME/justfile' > '$DIR/justfile'"

if [ -f "$HOME/justfile" ]; then
  cp "$HOME/justfile" "$HOME/justfile.old"
fi

ln -s "$DIR/justfile" "$HOME/justfile"
