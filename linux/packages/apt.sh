#!/usr/bin/env bash
#
#
# Apt packages
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

sudo add-apt-repository universe
sudo add-apt-repository multiverse

sudo apt -qq update
sudo apt -qq --assume-yes upgrade

# Install all packages from the package list file in this dir

xargs sudo apt -qq --assume-yes install < "$DIR/apt.packages.txt"

# Configure packages

pipx ensurepath

# Cleanup

sudo apt -qq --assume-yes autoremove
