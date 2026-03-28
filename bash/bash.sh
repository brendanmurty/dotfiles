#!/usr/bin/env bash
#
#
# Bash Shell: Apply customisations
#   - Makes a copy of the changed files first
#   - Then copies over the relevant files from this dir to $HOME with the right names
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

touch "$HOME/.bashrc" "$HOME/.bash_aliases" "$HOME/.bash_prompt"

# Create backups of current Bash config files for this user

cp "$HOME/.bashrc" "$HOME/.bashrc.before-dotfiles.bak"
cp "$HOME/.bash_aliases" "$HOME/.bash_aliases.before-dotfiles.bak"
cp "$HOME/.bash_prompt" "$HOME/.bash_prompt.before-dotfiles.bak"

# Download the '__git_ps1' script from the official Git repo to ~/.git_prompt.sh

touch "$HOME/.git_prompt.sh"

cp "$HOME/.git_prompt.sh" "$HOME/.git_prompt.sh.before-dotfiles.bak"

curl \
  --output "$HOME/.git_prompt.sh" \
  "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh"

# Copy over the customised Bash config files

cp "$DIR/.bashrc" "$HOME/.bashrc"
cp "$DIR/.bash_aliases" "$HOME/.bash_aliases"
cp "$DIR/.bash_prompt" "$HOME/.bash_prompt"

# Load the customisations in to the current terminal session.
# Future terminal sessions will automatically load ~/.bashrc

source "$HOME/.bashrc"
