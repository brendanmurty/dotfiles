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

info "Adding 'site.local' as an alias for 'localhost'"

echo "127.0.0.1 site.local" | sudo tee -a /etc/hosts > /dev/null
sudo systemctl restart systemd-resolved
