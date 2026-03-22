#!/usr/bin/env bash
#
#
# EndeavourOS Setup
#   - Assumes Gnome DE is used
#   - The package list can be updated with: pacman -Qqen > "../config/endeavouros_packages.txt"
#
#

PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" != "EndeavourOS" ]]; then
  echo "This script requires EndeavourOS."
  exit 0
fi

yay -S --needed - < "$PARENT_DIR/config/endeavouros_packages.txt"
