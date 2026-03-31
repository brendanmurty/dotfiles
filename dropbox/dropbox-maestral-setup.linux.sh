#!/usr/bin/env bash
#
#
# Dropbox - Setup Maestral client app for Dropbox
#   - More info: https://maestral.app/
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

sudo apt -qq --assume-yes install \
  python3 \
  python-is-python3 \
  pipx

pipx install maestral[gui]

maestral start

maestral auth link

maestral gui &
