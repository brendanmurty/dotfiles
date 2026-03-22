#!/usr/bin/env bash
#
#
# Apt setup
#
#

PARENT_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
OS_NAME="$(bash $PARENT_DIR/lib/get-os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

sudo apt -qq update
sudo apt -qq --assume-yes upgrade

sudo apt -qq --assume-yes install \
  curl \
  zip \
  unzip \
  git \
  update-manager \
  apt-transport-https \
  ca-certificates \
  libappindicator3-1 \
  software-properties-common \
  gnome-shell \
  gnome-shell-extensions \
  gnome-tweaks \
  >/dev/null 2>&1

sudo apt -qq --assume-yes autoremove
