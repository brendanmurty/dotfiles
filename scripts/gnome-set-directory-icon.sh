#!/usr/bin/env bash
#
# Customise a directory icon in Nautilus
#

DIR_PATH="$HOME/Drive"
DIR_ICON="/usr/share/icons/Adwaita/scalable/places/"

gio set -t string "$DIR_PATH" metadata::custom-icon "file://$DIR_ICON/user-bookmarks.svg"

# Remove custom icon
# gio set -t unset "$DIR_PATH" metadata::custom-icon
