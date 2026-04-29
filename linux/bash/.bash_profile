#
#
# ~/.bash_profile
#   - Load other Bash config files if they exist
#   - Contains user specific tools and config
#
#

# Load other Bash config files if they exist

if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.git_bash_prompt.sh" ]; then
  source "$HOME/.git_bash_prompt.sh"
fi

if [ -f "$HOME/.git_bash_autocomplete.sh" ]; then
  source "$HOME/.git_bash_autocomplete.sh"
fi

if [ -f "$HOME/.bash_prompt" ]; then
  source "$HOME/.bash_prompt"
fi

# Helper function to add a dir to the PATH env var if it's not already there

pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# Update PATH to include user level bin directories if they exist

pathadd "$HOME/bin"

pathadd "$HOME/.local/bin"

pathadd "/usr/local/bin"

pathadd "$HOME/.deno/bin"

# Configure Deno if it's installed in the default location

if [ -f "$HOME/.deno/env" ]; then
  source "$HOME/.deno/env"
fi

# Search for a Homebrew installation and load it if found

if [ -d "$HOME/.brew" ]; then
  export BREW_DIR="$HOME/.brew"
elif [ -d "/home/linuxbrew/.linuxbrew" ]; then
  export BREW_DIR="/home/linuxbrew/.linuxbrew"
elif [ -d "/opt/homebrew" ]; then
  export BREW_DIR="/opt/homebrew"
elif [ -d "/usr/local" ]; then
  export BREW_DIR="/usr/local"
fi

if [[ "$BREW_DIR" != "" ]]; then
  export HOMEBREW_RELOCATE_BUILD_PREFIX="$BREW_DIR"
  export HOMEBREW_CELLAR="$BREW_DIR/Cellar"
  export HOMEBREW_PREFIX="$BREW_DIR"

  export HOMEBREW_NO_UPDATE_REPORT_FORMULAE=1
  export HOMEBREW_NO_UPDATE_REPORT_CASKS=1
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_NO_ANALYTICS=1

  # eval "$($BREW_DIR/bin/brew shellenv bash)"

  pathadd "$BREW_DIR/bin"

  alias brew="$BREW_DIR/bin/brew"
fi

# Configure NVM if it's installed to the default location

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"

  source "$HOME/.nvm/nvm.sh" > /dev/null 2>&1

  nvm install --lts > /dev/null 2>&1
  nvm alias default "lts/*" > /dev/null 2>&1
fi

# Set suitable user level shell variables

export SHELL=$(which bash)

export TERM=xterm-256color

export BASH_SILENCE_DEPRECATION_WARNING=1
