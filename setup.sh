#!/usr/bin/env bash
#
#
# Interactive setup script
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"

OS_NAME="$(bash $DIR/scripts/os-name.sh)"

info() { echo -e "\033[36m$1\033[0m"; }
warn() { echo -e "\033[33m$1\033[0m"; }
error() { echo -e "\033[31m$1\033[0m"; }

if [[ "$OS_NAME" == "Windows" ]]; then
  error 'These scripts require either Linux or macOS.'
  exit 1
fi

warn "The scripts used here will make changes to your system."
warn "Please review the content of the scripts before running them."

read -n 1 -rp "Continue? (y/n) " continue_setup
echo ''

if [[ "$continue_setup" != "y" ]]; then
  info 'Cancelled'
  exit 0
fi

if [ ! -d "$HOME/Dotfiles" ]; then
  info "Setup symlink: '$HOME/Dotfiles' > '$REPO_DIR'"
  ln -s "$REPO_DIR" "$HOME/Dotfiles"
else
  warn "Skipped symlink setup as '$HOME/Dotfiles' already exists"
fi

if command -v brew >/dev/null 2>&1 ; then
  warn 'Homebrew package manager already installed'
else
  info 'Homebrew package manager setup'

  read -n 1 -rp "Install Homebrew to the default location? (y/n) " brew
  echo ''

  if [[ "$brew" == "y" ]]; then
    bash "$DIR/homebrew/homebrew-setup.sh"
  else
    read -n 1 -rp "Install Homebrew to '$HOME/.brew'? (y/n) " brew_user
    echo ''

    if [[ "$brew_user" == "y" ]]; then
      if [[ "$OS_NAME" == "macOS" ]]; then
        bash "$DIR/homebrew/homebrew-setup-user.macos.sh"
      else
        bash "$DIR/homebrew/homebrew-setup-user.linux.sh"
      fi
    else
      error 'Homebrew is required for various scripts'
      exit 1
    fi
  fi
fi

info 'Just command runner setup'

bash "$DIR/just/just-setup.sh"
