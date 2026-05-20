#!/usr/bin/env bash
#
#
# Homebrew: Install on Linux or macOS using the official method and default install location
#   - Installs Homebrew based on docs from https://brew.sh/
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo 'This script requires Linux or macOS.'
  exit 1
elif [[ "$OS_NAME" == "Linux" ]]; then
  echo 'Homebrew: Requesting sudo'
  sudo -v
fi

echo 'Homebrew: Installing to default location'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
