#!/usr/bin/env bash
#
#
# Install fonts
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Windows" ]] || [[ "$OS_NAME" == "macOS" ]]; then
  echo "This script requires Linux."
  exit 1
fi

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

echo "Copying Commit Mono fonts to '$FONT_DIR'"

cp "$DIR/CommitMono/"*.otf "$FONT_DIR/"

if [[ "$OS_NAME" == "Fedora" ]]; then
  echo 'Fedora: Requesting sudo'
  sudo -v

  echo 'Fedora: Installing Google Noto Emoji fonts'
  sudo dnf install -y google-noto-color-emoji-fonts >/dev/null 2>&1
fi

echo 'Rebuilding the font cache to make fonts available'

fc-cache -fv > /dev/null 2>&1

echo 'Fonts are ready to use.'
