#!/usr/bin/env bash
#
#
# Dropbox CLI setup for Linux
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

dropbox autostart y
dropbox start
dropbox throttle unlimited unlimited
