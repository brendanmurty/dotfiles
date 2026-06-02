#!/usr/bin/env bash
#
#
# Node setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" == "Windows" ]]; then
  echo 'Please install Node manually - https://nodejs.org/'
  exit 1
fi

echo 'Setup the NVM directory'

export NVM_DIR="${HOME}/.nvm"
rm -rf "$NVM_DIR"
mkdir -p "$NVM_DIR"

echo 'Install NVM'

# Command from https://github.com/nvm-sh/nvm?tab=readme-ov-file#git-install
git clone --quiet "https://github.com/nvm-sh/nvm.git" "$NVM_DIR"

echo 'Load NVM'

source "${HOME}/.nvm/nvm.sh"

echo 'Default to Node LTS version and install that'

nvm install --lts > /dev/null 2>&1
nvm alias default "lts/*" > /dev/null 2>&1
