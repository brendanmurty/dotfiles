#!/usr/bin/env bash
#
#
# Dropbox config
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"

BIN="$(cd "$(dirname "$0")" && cd ../bin && pwd)"
OS_NAME="$(bash $BIN/os-name.sh)"

INSTALL_MESSAGE='Please install Dropbox manually from https://www.dropbox.com/install'

if [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 1
elif [[ "$OS_NAME" == "macOS" ]]; then
  if [ -d "/Applications/Dropbox.app/Contents" ]; then
    echo 'Dropbox is already installed.'
  else
    echo "$INSTALL_MESSAGE"
    exit 1
  fi
else
  if command -v dropbox >/dev/null 2>&1 ; then
    echo 'Dropbox is already installed.'
  else
    if command -v flatpak >/dev/null 2>&1 ; then
      echo 'Installing Dropbox via Flatpak'

      flatpak install -y com.dropbox.Client

      echo 'Configuring Dropbox'

      flatpak run com.dropbox.Client start
      flatpak run com.dropbox.Client throttle unlimited unlimited
      flatpak run com.dropbox.Client autostart y

      echo 'Setting up Dropbox to start on user login'

      mkdir -p "$HOME/.config/autostart"
      cp "$DIR/dropbox.desktop" "$HOME/.config/autostart/Dropbox.desktop"
    else
      echo "$INSTALL_MESSAGE"
      exit 1
    fi
  fi
fi

if [ -d "$HOME/Dropbox" ]; then
  echo "Coping over 'rules.dropboxignore.txt' to '$HOME/Dropbox/rules.dropboxignore'."
  cp -n "$DIR/rules.dropboxignore.txt" "$HOME/Dropbox/rules.dropboxignore"
else
  echo "Could not find Dropbox directory."
  echo "Please copy over 'rules.dropboxignore.txt' to your Dropbox directory,"
  echo "then rename it to 'rules.dropboxignore'."
fi
