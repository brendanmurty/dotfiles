#!/usr/bin/env bash
#
# Customise a directory icon in Nautilus
#  - To remove a custom icon: gio set -t unset "/home/bob/dir/path" metadata::custom-icon
#

DIR_PATH="$HOME/Sync"
DIR_ICON="/usr/share/icons/Yaru-prussiangreen/256x256@2x/places"

gio set -t string "$DIR_PATH" metadata::custom-icon "file://$DIR_ICON/user-home.png"
