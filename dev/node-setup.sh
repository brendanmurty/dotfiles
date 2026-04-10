#!/usr/bin/env bash
#
#
# Node setup
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 0
fi

# Setup the NVM directory

export NVM_DIR="${HOME}/.nvm"
rm -rf "$NVM_DIR"
mkdir -p "$NVM_DIR"

# Install NVM, command from https://github.com/nvm-sh/nvm?tab=readme-ov-file#git-install

git clone --quiet "https://github.com/nvm-sh/nvm.git" "$NVM_DIR"
git checkout --quiet v0.40.4

# Load NVM

source "${HOME}/.nvm/nvm.sh"

# Set a default Node version and install that to start

nvm install --lts
nvm alias default "lts/*"
