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

echo "Copying over Commit Mono Nerd Fonts from https://www.nerdfonts.com/font-downloads"

cp "$DIR/CommitMono/"*.otf "$FONT_DIR/"

if [[ "$OS_NAME" == "Fedora" ]]; then
  echo 'Fedora: Requesting sudo'
  sudo -v

  echo 'Fedora: Installing Google Noto Emoji fonts'
  sudo dnf install -y google-noto-color-emoji-fonts >/dev/null 2>&1
elif [[ "$OS_NAME" == "Ubuntu" ]]; then
  echo 'Ubuntu: Requesting sudo'
  sudo -v

  echo 'Ubuntu: Installing Google Noto Emoji fonts'
  sudo apt -qq --assume-yes install fonts-noto-color-emoji >/dev/null 2>&1

  FONT_CONF_DIR="$HOME/.config/fontconfig/conf.d"
  mkdir -p "$FONT_CONF_DIR"

  if [[ ! -f "$FONT_CONF_DIR/01-emoji.conf" ]]; then
    echo 'Ubuntu: Creating font config file for Noto Emoji'
    cp "$DIR/emoji-fonts.conf" "$FONT_CONF_DIR/01-emoji.conf"
  fi
fi

echo 'Rebuilding the font cache'

fc-cache -f -v > /dev/null 2>&1

echo 'Fonts are now ready to use'
