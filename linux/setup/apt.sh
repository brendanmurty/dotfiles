#!/usr/bin/env bash
#
#
# Apt setup
#
#

sudo apt -qq update
sudo apt -qq --assume-yes upgrade

sudo apt -qq --assume-yes install \
  update-manager \
  apt-transport-https \
  ca-certificates \
  libappindicator3-1 \
  software-properties-common \
  gnome-shell \
  gnome-shell-extensions \
  gnome-tweaks \
  curl \
  zip \
  unzip \
  git \
  >/dev/null 2>&1

sudo apt -qq --assume-yes autoremove
