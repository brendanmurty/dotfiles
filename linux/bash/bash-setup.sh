#!/usr/bin/env bash
#
#
# Bash Shell: Apply customisations
#   - Makes a copy of the changed files first
#   - Then copies over the relevant files from this dir to $HOME with the right names
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 1
fi

touch "$HOME/.bash_aliases" "$HOME/.bash_prompt" "$HOME/.bash_profile"

# Create backups of current Bash config files for this user

cp "$HOME/.bash_aliases" "$HOME/.bash_aliases.old"
cp "$HOME/.bash_prompt" "$HOME/.bash_prompt.old"
cp "$HOME/.bash_profile" "$HOME/.bash_profile.old"

# Download the '__git_ps1' script from the official Git repo to ~/.bash_prompt_git.sh

touch "$HOME/.bash_prompt_git.sh"
cp "$HOME/.bash_prompt_git.sh" "$HOME/.bash_prompt_git.sh.old"
curl \
  --output "$HOME/.bash_prompt_git.sh" \
  "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh"

# Copy over the customised Bash config files

cp "$DIR/.bash_aliases" "$HOME/.bash_aliases"
cp "$DIR/.bash_prompt" "$HOME/.bash_prompt"
cp "$DIR/.bash_profile" "$HOME/.bash_profile"

# Load the customisations in to the current terminal session.
# Future terminal sessions will automatically load ~/.bash_profile

echo '' >> "$HOME/.bashrc"
echo 'source "$HOME/.bash_profile"' >> "$HOME/.bashrc"

source "$HOME/.bashrc"
