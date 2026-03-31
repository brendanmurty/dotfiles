#!/usr/bin/env bash
#
#
# Dropbox - Setup Maestral client app for Dropbox
#   - More info: https://maestral.app/
#   - Config file reference: https://maestral.app/docs/configfile
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

mkdir -p "$HOME/Dropbox"

maestral start
maestral move-dir "$HOME/Dropbox"

maestral autostart -Y
maestral bandwidth-limit up 0
maestral bandwidth-limit down 0
maestral notify level SYNCISSUE

maestral auth link

echo ''
echo '----'
echo ''
echo 'Maestral installed and configured, to open the app run: maestral gui &'
