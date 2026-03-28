#!/usr/bin/env bash
#
#
# Snap setup
#   - Command to generate the user installed packages:
#     snap list --unicode=never | tail -n +2 | grep -v 'core\|gnome-\|snapd\|snap-store\|bare\|canonical-livepatch' | awk '{print $1}' > "./snap.packages.txt"
#
#

PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

# Only keep the latest two versions of each Snap Package

sudo snap set system refresh.retain=2

# Install all packages from the package list file in this dir

cat "./snap.packages.txt" | xargs -n 1 sudo snap install
