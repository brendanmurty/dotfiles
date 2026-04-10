#!/usr/bin/env bash
#
#
# Linux: Update '*.packages.txt' list files
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

cd "$THIS_DIR/packages"

flatpak list --app --columns=application > "./flatpak.packages.txt"

gnome-extensions list --user --enabled > "./gnome-shell-extensions.txt"

if [[ "$OS_NAME" == "EndeavourOS" ]]; then
  pacman -Qqen > "./pacman.packages.txt"
fi

if [[ "$OS_NAME" == "Ubuntu" ]]; then
  snap list --unicode=never | tail -n +2 | grep -v 'core\|gnome-\|snapd\|snap-store\|bare\|canonical-livepatch' | awk '{print $1}' > "./snap.packages.txt"
fi
