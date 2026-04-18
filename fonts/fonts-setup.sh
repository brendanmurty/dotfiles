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

echo "Copying the font files to '$FONT_DIR'"

cp "$DIR/CommitMono/"*.otf "$FONT_DIR/"

echo 'Rebuilding the font cache to make fonts available'

fc-cache -f -v > /dev/null 2>&1

echo 'Fonts are ready to use.'

