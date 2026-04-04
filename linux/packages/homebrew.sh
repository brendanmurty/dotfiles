#!/usr/bin/env bash
#
#
# Homebrew packages
#   - Installs the Homebrew packages listed in 'homebrew.packages.txt'
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

# Install all packages from the package list file in this dir

xargs -a "$DIR/homebrew.packages.txt" brew install
