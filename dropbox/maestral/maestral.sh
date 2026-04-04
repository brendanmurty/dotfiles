#!/usr/bin/env bash
#
#
# Dropbox - Setup Maestral client app for Dropbox
#   - More info: https://maestral.app/
#   - Config file reference: https://maestral.app/docs/configfile
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

echo '==> Installing dependencies'

sudo apt -qq --assume-yes install \
  python3 \
  python-is-python3 \
  python3-pyqt5 \
  pipx

echo '==> Installing Maestral'

pipx install maestral[gui]
pipx install maestral-qt

echo '==> Configuring Maestral'

maestral start
maestral bandwidth-limit up 0
maestral bandwidth-limit down 0
maestral notify level SYNCISSUE
maestral autostart --yes
maestral auth link

echo '==> Copying over Maestral ignore list'

cp "$DIR/maestral.ignore.txt" "$(maestral config get path)/.mignore"

echo '==> Copying over app icon and applications menu item'

mkdir -p "$HOME/.local/share/icons/hicolor/512x512/apps"
cp "$DIR/maestral.png" "$HOME/.local/share/icons/hicolor/512x512/apps/Maestral.png"

chmod a+x "$DIR/maestral.desktop"
rm -rf "$HOME/.local/share/applications/Maestral.desktop"
rm -rf "$HOME/.config/autostart/Maestral.desktop"
cp "$DIR/maestral.desktop" "$HOME/.local/share/applications/Maestral.desktop"
cp "$DIR/maestral.desktop" "$HOME/.config/autostart/Maestral.desktop"

echo '==> Updating launcher application list'

update-desktop-database ~/.local/share/applications
xdg-desktop-menu forceupdate

echo '==> Done, to open Maestral now run: nohup maestral gui &'
