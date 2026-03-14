#!/usr/bin/env bash
#
#
# Bash Shell: Apply customisations
#   - Makes a copy of the changed files first
#   - Then copies over the relevant files from this dir to $HOME with the right names
#
#

touch "$HOME/.bash_aliases" "$HOME/.bash_profile" "$HOME/.bash_prompt"

# Create backups of current Bash config files for this user

cp "$HOME/.bash_aliases" "$HOME/.bash_aliases.before-dotfiles.bak"
cp "$HOME/.bash_profile" "$HOME/.bash_profile.before-dotfiles.bak"
cp "$HOME/.bash_prompt" "$HOME/.bash_prompt.before-dotfiles.bak"

# Download the '__git_ps1' script from the official Git repo

touch "$HOME/.git_prompt.sh"
cp "$HOME/.git_prompt.sh" "$HOME/.git_prompt.sh.before-dotfiles.bak"
curl --output "$HOME/.git_prompt.sh" "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh"
source "$HOME/.git_prompt.sh"

# Copy over the customised Bash config files

cp "./config/bash_aliases.txt" "$HOME/.bash_aliases"
cp "./config/bash_profile.txt" "$HOME/.bash_profile"
cp "./config/bash_prompt.txt" "$HOME/.bash_prompt"

# Load them in to the current terminal session

source "$HOME/.bash_profile"

# Persist these changes for each new terminal session by appending to "~/.bashrc"

touch "$HOME/.bashrc"
echo '' >> "$HOME/.bashrc"
echo 'source "/home/murty/.bash_profile"' >> "$HOME/.bashrc"
