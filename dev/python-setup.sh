#!/usr/bin/env bash
#
#
# Python setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" != "Ubuntu" ]]; then
  error 'Please install Python 3 manually - https://www.python.org/downloads/'
  exit 1
fi

info "Requesting sudo"

sudo -v

info "Installing packages"

sudo apt install -qq --assume-yes \
	python-is-python3 \
	python3-exifread \
	python3-dotenv pipx > /dev/null 2>&1

info "Running 'pipx ensurepath'"

pipx ensurepath > /dev/null 2>&1

info "Reloading '$HOME/.bashrc' to apply changes to this session"

source "$HOME/.bashrc"

success "Python should be ready to go"
