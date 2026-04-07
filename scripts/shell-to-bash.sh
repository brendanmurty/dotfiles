#!/usr/bin/env bash
#
#
# Helper script that changes the active shell to Bash
#
#

SCRIPTS="$(cd "$(dirname "$0")" && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == 'Windows' ]]; then
  echo 'Requires Linux or macOS'
  exit 0
elif [[ "$OS_NAME" == 'Linux' ]]; then
  export SHELL=$(which bash)
  source ~/.bashrc
elif [[ "$OS_NAME" == 'macOS' ]]; then
  chsh -s /bin/bash
  bash
fi
