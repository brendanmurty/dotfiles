#!/usr/bin/env bash
#
#
# Helper script that changes the active shell to Bash
#
#

SCRIPTS="$(cd "$(dirname "$0")" && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == 'Windows' ]]; then
  echo 'Requires Linux or macOS'
  exit 0
fi

# Get the path to the Bash binary, which is
# different on macOS and some Linux variants
BASH_PATH=$(which bash)

if [[ "$OS_NAME" == 'Linux' ]]; then
  # Skip changing user shell if it's already Bash
  if [[ "$SHELL" != "$BASH_PATH" ]]; then
    export SHELL="$BASH_PATH"
  fi

  # Load the main Bash config file
  source ~/.bashrc
elif [[ "$OS_NAME" == 'macOS' ]]; then
  # Skip changing user shell if it's already Bash
  if [[ "$SHELL" != "$BASH_PATH" ]]; then
    # Change the user's shell to Bash
    chsh -s "$BASH_PATH"

    # Add this script to ~/.zshrc so future sessions will use Bash
    echo "$SCRIPTS/shell-to-bash.sh" >> ~/.zshrc
  fi

  # Run Bash to prompt the loading of Bash config files
  bash
fi
