#!/usr/bin/env bash
#
#
# Git: Setup Bash prompt and Git Branch autocomplete
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

# Ubuntu: Install Git and Curl

if [[ "$OS_NAME" == "Ubuntu" ]]; then
  sudo apt update -qq
  sudo apt -qq --assume-yes install git curl
fi

# Download the '__git_ps1' script from the official Git Repo to '~/.git_bash_prompt.sh'
#   - When in a Git directory, this gets details about the status of the Repo

touch "$HOME/.git_bash_prompt.sh"
cp "$HOME/.git_bash_prompt.sh" "$HOME/.git_bash_prompt.sh.old"
curl \
  --output "$HOME/.git_bash_prompt.sh" \
  "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh"

# Download the 'git-completion' script from the official Git Repo to '~/.git_bash_autocomplete.sh'
#   - When in a Git directory, this adds auto complete for Git Branches

touch "$HOME/.git_bash_autocomplete.sh"
cp "$HOME/.git_bash_autocomplete.sh" "$HOME/.git_bash_autocomplete.sh.old"
curl \
  --output "$HOME/.git_bash_autocomplete.sh" \
  "https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash"
