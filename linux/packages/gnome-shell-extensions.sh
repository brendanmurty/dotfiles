#!/usr/bin/env bash
#
#
# Install Gnome Shell Extensions
#   - To update the Gnome Shell Extensions list: gnome-extensions list --user --enabled > "./gnome-shell-extensions.txt"
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

# Install Gnome Shell Extensions from 'gnome-shell-extensions.txt'

pipx install gnome-extensions-cli --system-site-packages

cat "$DIR/gnome-shell-extensions.txt" | while read extension
do
  gext install $extension
  gext enable $extension
done
