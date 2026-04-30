#!/usr/bin/env bash
#
#
# Linux: Ubuntu 26.04 fixes
#
#

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

OS_NAME="$(bash $REPO_DIR/scripts/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

# Request sudo

sudo -v

# Fix broken system package dependencies

sudo dpkg --configure -a

# Continue interupted package installs

sudo apt-get install -f

# Update package lists

sudo apt update -qq

# Cleanup packages

sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

# Install the Software & Updates app

sudo apt -qq --assume-yes install \
  software-properties-gtk

# Prompt Ubuntu Pro setup process

sudo pro attach

# Fix Security Center not reading Ubuntu Pro status

sudo snap connect desktop-security-center:system-observe
