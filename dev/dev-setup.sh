#!/usr/bin/env bash
#
#
# Dev setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" == "Windows" ]] | [[ "$OS" == "macOS" ]]; then
  error 'This script requires Linux';
  exit 1
fi

warn 'Requesting sudo'
sudo -v

info 'Run: dev/caddy/caddy-setup.sh'
bash "$REPO/dev/caddy/caddy-setup.sh"
