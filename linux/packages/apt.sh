#!/usr/bin/env bash
#
#
# Apt setup
#
#

PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

sudo apt -qq update
sudo apt -qq --assume-yes upgrade

# Install all packages from the package list file in this dir

xargs sudo apt -qq --assume-yes install < "./apt.packages.txt"

# Cleanup

sudo apt -qq --assume-yes autoremove
