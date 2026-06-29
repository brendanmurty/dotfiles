#!/usr/bin/env bash
#
#
# Mise setup
# 	- More info at https://mise.en.dev/
# 	- Install commands from https://mise.en.dev/installing-mise.html
#   - To run this script:
#     - Clone this repo
#     - Open that dir in Terminal
#     - Run: bash ./dev/mise/mise-setup.sh
#
#

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"

if [[ "$(os)" == "Windows" ]]; then
  error 'Please install Mise manually - https://mise.en.dev/'
  exit 1
fi

info "Installing Mise"

curl https://mise.run | sh

info "Reloading '$HOME/.bashrc' to allow this session to access Mise"

source "$HOME/.bashrc"

if ! command -v bash-completion > /dev/null 2>&1 ; then
  info "Installing system 'bash-completion' package"
  sudo apt -qq --assume-yes install bash-completion > /dev/null 2>&1
fi

info "Installing Bash Completions for Mise"

mkdir -p "$HOME/.local/share/bash-completion/completions"
mise completion bash --include-bash-completion-lib > "$HOME/.local/share/bash-completion/completions/mise"

success "Mise installed successfully"
