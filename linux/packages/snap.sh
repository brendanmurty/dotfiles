#!/usr/bin/env bash
#
#
# Snap packages
#   - Command to generate the user installed packages:
#     snap list --unicode=never | tail -n +2 | grep -v 'core\|gnome-\|snapd\|snap-store\|bare\|canonical-livepatch' | awk '{print $1}' > "./snap.packages.txt"
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

# Only keep the latest two versions of each Snap Package

sudo snap set system refresh.retain=2

# Install all packages from the package list file in this dir

cat "$DIR/snap.packages.txt" | xargs -n 1 sudo snap install
