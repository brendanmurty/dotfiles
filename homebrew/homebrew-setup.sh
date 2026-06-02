#!/usr/bin/env bash
#
#
# Homebrew: Install on Linux or macOS using the official method and default install location
#   - Installs Homebrew based on docs from https://brew.sh/
#
#

BIN="$(cd "$(dirname "$0")" && cd ../bin && pwd)"
OS="$(bash $BIN/os.sh)"

if [[ "$OS" == "Windows" ]]; then
  echo 'This script requires Linux or macOS.'
  exit 1
elif [[ "$OS" == "Linux" ]]; then
  echo 'Homebrew: Requesting sudo'
  sudo -v
fi

echo 'Homebrew: Installing to default location'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Installing Bold Brew (bbrew)'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Valkyrie00/bold-brew/main/install.sh)"
