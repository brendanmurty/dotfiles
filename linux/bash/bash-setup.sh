#!/usr/bin/env bash
#
#
# Bash Shell: Apply customisations
#   - Makes a copy of the changed files first
#   - Then copies over the relevant files from this dir to $HOME with the right names
#
#

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" == "Windows" ]]; then
  error "This script requires Linux or macOS."
  exit 0
fi

info 'Create backups of current Bash config files for this user'

[ -f "$HOME/.bash_aliases" ] && mv "$HOME/.bash_aliases" "$HOME/.bash_aliases.old"
[ -f "$HOME/.bash_prompt" ] && mv "$HOME/.bash_prompt" "$HOME/.bash_prompt.old"
[ -f "$HOME/.bash_profile" ] && mv "$HOME/.bash_profile" "$HOME/.bash_profile.old"
[ -f "$HOME/.bashrc" ] && mv "$HOME/.bashrc" "$HOME/.bashrc.old"

info 'Setup Git Bash features'

bash "$REPO/dev/git/git-bash-setup.sh"

info 'Add symlinks to the customised Bash config files'

ln -s "$REPO/linux/bash/.bash_aliases" "$HOME/.bash_aliases"
ln -s "$REPO/linux/bash/.bash_prompt" "$HOME/.bash_prompt"
ln -s "$REPO/linux/bash/.bash_profile" "$HOME/.bash_profile"

info "Load the customised Bash config files at the end of '$HOME/.bashrc'"

echo '' >> "$HOME/.bashrc"
echo '# Load customised Bash config, prompt and aliases' >> "$HOME/.bashrc"
echo 'source "$HOME/.bash_profile"' >> "$HOME/.bashrc"

source "$HOME/.bashrc"

success 'Future terminal sessions will automatically load the customised Bash config files'
