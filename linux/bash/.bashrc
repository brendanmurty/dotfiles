#
#
# ~/.bashrc
#   - Loads other Bash config files if they exist
#   - Updates the system PATH variable as needed
#
#

# Skip if not running interactively

[[ $- != *i* ]] && return

# Load other Bash config files if they exist

if [ -f "$HOME/.local/bin/env" ]; then
  source "$HOME/.local/bin/env"
fi

if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.git_prompt.sh" ]; then
  source "$HOME/.git_prompt.sh"
fi

if [ -f "$HOME/.bash_prompt" ]; then
  source "$HOME/.bash_prompt"
fi
