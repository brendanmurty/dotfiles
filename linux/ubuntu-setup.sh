#!/usr/bin/env bash
#
#
# Ubuntu initial setup
#   - Tested on Ubuntu 24
#
#

sudo apt update
sudo apt upgrade

sudo apt -y install \
    curl \
    zip \
    git \
    vim \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnome-shell \
    gnome-shell-extensions \
    gnome-tweaks \
    flatpak \
    gnome-software-plugin-flatpak

sudo select-editor
sudo update-alternatives --config editor

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

bash "./gnome-customise.sh"

bash "./bash-custom-set.sh"

bash "./homebrew-linux-user-install.sh"

echo 'Ubuntu setup script completed.'
echo 'A system reboot is required to apply some of these updates.'
