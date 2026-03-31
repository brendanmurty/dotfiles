#!/usr/bin/env bash
#
#
# Dropbox - Setup Maestral client app for Dropbox
#   - More info: https://maestral.app/
#   - Config file reference: https://maestral.app/docs/configfile
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

echo '==> Installing dependencies'

sudo apt -qq --assume-yes install \
  python3 \
  python-is-python3 \
  pipx

echo '==> Installing "maestral[gui]" with "pipx"'

pipx install maestral[gui]

echo '==> Maestral configuration starting.'

maestral start

maestral autostart -Y
maestral bandwidth-limit up 0
maestral bandwidth-limit down 0
maestral notify level SYNCISSUE

maestral auth link

echo '==> Maestral configuration completed.'

echo '==> Copying over app icon and applications menu item.'

mkdir -p "$HOME/.local/share/icons/hicolor/512x512/apps"
cp "$DIR/Maestral.png" "$HOME/.local/share/icons/hicolor/512x512/apps/Maestral.png"
cp "$DIR/Maestral.desktop" "$HOME/.local/share/applications/Maestral.desktop"
xdg-desktop-menu forceupdate

echo '==> Done, to open Maestral now run: maestral gui &'
