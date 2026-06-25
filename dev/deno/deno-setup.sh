#!/usr/bin/env bash
#
#
# Deno setup
#   - To run this script:
#     - Clone this repo
#     - Open that dir in Terminal
#     - Run: bash ./dev/node/node-setup.sh
#
#

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" == "Windows" ]]; then
  error 'Please install Deno for Windows manually - https://deno.com/'
  exit 1
elif [[ "$OS" == "macOS" ]]; then
  info 'Installing Deno for macOS'
  # From https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
else
  info 'Installing Deno for Linux'
  # From https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
fi

info "Install the 'dx' alias for 'deno x'"
# From https://docs.deno.com/runtime/reference/cli/x/
deno x --install-alias

success 'Deno installed'
