#!/usr/bin/env bash
#
#
# Bash Shell: Apply customisations
#   - Makes a copy of the changed files first
#   - Then copies over the relevant files from this dir to $HOME with the right names
#
#

PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

touch "$HOME/.bashrc" "$HOME/.bash_aliases" "$HOME/.bash_prompt"

# Create backups of current Bash config files for this user

cp "$HOME/.bashrc" "$HOME/.bashrc.before-dotfiles.bak"
cp "$HOME/.bash_aliases" "$HOME/.bash_aliases.before-dotfiles.bak"
cp "$HOME/.bash_prompt" "$HOME/.bash_prompt.before-dotfiles.bak"

# Download the '__git_ps1' script from the official Git repo

touch "$HOME/.git_prompt.sh"
cp "$HOME/.git_prompt.sh" "$HOME/.git_prompt.sh.before-dotfiles.bak"
curl --output "$HOME/.git_prompt.sh" "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh"
source "$HOME/.git_prompt.sh"

# Copy over the customised Bash config files

cp "$PARENT_DIR/config/bash_aliases.txt" "$HOME/.bash_aliases"
cp "$PARENT_DIR/config/bashrc.txt" "$HOME/.bashrc"
cp "$PARENT_DIR/config/bash_prompt.txt" "$HOME/.bash_prompt"

# Load them in to the current terminal session

source "$HOME/.bashrc"
