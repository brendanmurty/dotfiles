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

success "Mise installed successfully"
