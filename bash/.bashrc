#
#
# ~/.bashrc
#   - Loads other Bash config files if they exist
#   - Updates the system PATH variable as needed
#   - Configures common tools
#
#

# Skip if not running interactively

[[ $- != *i* ]] && return

# Helper function to add a dir to the PATH env var if it's not already there

pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# Update PATH to include user level bin directories if they exist

if [ -d "$HOME/bin" ]; then
  pathadd "$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  pathadd "$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.local/bin/env" ]; then
  source "$HOME/.local/bin/env"
fi

if [ -f "/opt/homebrew/opt/python@3.12/libexec/bin" ]; then
  pathadd "/opt/homebrew/opt/python@3.12/libexec/bin"
fi

# Load other Bash config files if they exist

if [ -f "$HOME/.bash_profile" ]; then
  source "$HOME/.bash_profile"
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

# Configure Deno if it's installed in the default location

if [ -d "$HOME/.deno" ]; then
  source "$HOME/.deno/env"
fi

# Configure user-level Homebrew if it's installed there

BREW_DIR="$HOME/.brew"
if [ -d "$BREW_DIR" ]; then
  export HOMEBREW_RELOCATE_BUILD_PREFIX="$BREW_DIR"
  export HOMEBREW_CELLAR="$BREW_DIR/Cellar"
  export HOMEBREW_PREFIX="$BREW_DIR"
  export HOMEBREW_NO_UPDATE_REPORT_FORMULAE=1
  export HOMEBREW_NO_UPDATE_REPORT_CASKS=1
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_NO_ANALYTICS=1
  eval "$($BREW_DIR/bin/brew shellenv bash)"
  alias brew="$BREW_DIR/bin/brew"
fi

# Configure NVM if it's installed via user-level Homebrew

if [ -d "$HOME/.brew/opt/nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  mkdir -p "$NVM_DIR"
  source "$HOME/.brew/opt/nvm/nvm.sh" > /dev/null 2>&1
  source "$HOME/.brew/opt/nvm/etc/bash_completion.d/nvm" > /dev/null 2>&1
  export NVM_SYMLINK_CURRENT=true
fi

# Set suitable user level shell variables

export SHELL=$(which bash)

export TERM=xterm-256color

export BASH_SILENCE_DEPRECATION_WARNING=1
