#!/usr/bin/env bash
#
#
# Install packages on EndeavourOS systems
#   - Assumes Gnome desktop environment is used
#   - The package list can be updated with: pacman -Qqen > "./pacman.packages.txt"
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "EndeavourOS" ]]; then
  echo "This script requires EndeavourOS."
  exit 0
fi

# Install all packages from the package list file in this dir

yay -S --needed - < "$DIR/pacman.packages.txt"
