#!/usr/bin/env bash
#
#
# Bash Shell: Apply customisations
#   - Makes a copy of the changed files first
#   - Then copies over the relevant files from this dir to $HOME with the right names
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd ../.. && pwd)"
OS="$(bash $REPO_DIR/bin/os.sh)"

if [[ "$OS" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 1
fi

touch "$HOME/.bash_aliases" "$HOME/.bash_prompt" "$HOME/.bash_profile"

echo 'Create backups of current Bash config files for this user'

cp "$HOME/.bash_aliases" "$HOME/.bash_aliases.old"
cp "$HOME/.bash_prompt" "$HOME/.bash_prompt.old"
cp "$HOME/.bash_profile" "$HOME/.bash_profile.old"
cp "$HOME/.bashrc" "$HOME/.bashrc.old"

echo 'Setup Git Bash features'

bash "$REPO_DIR/git/git-bash-setup.sh"

echo 'Copy over the customised Bash config files'

cp "$REPO_DIR/linux/bash/.bash_aliases" "$HOME/.bash_aliases"
cp "$REPO_DIR/linux/bash/.bash_prompt" "$HOME/.bash_prompt"
cp "$REPO_DIR/linux/bash/.bash_profile" "$HOME/.bash_profile"

echo 'Load the customisations in to the current terminal session.'

echo '' >> "$HOME/.bashrc"
echo 'source "$HOME/.bash_profile"' >> "$HOME/.bashrc"

source "$HOME/.bashrc"

echo 'Future terminal sessions will automatically load via ~/.bash_profile'
