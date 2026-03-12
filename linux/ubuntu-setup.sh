#!/usr/bin/env bash
#
#
# Ubuntu initial setup
#   - Tested on Ubuntu 24
#
#

sudo apt update
sudo apt upgrade

sudo apt -y install git vim

sudo select-editor
sudo update-alternatives --config editor

sudo apt -y install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo 'Ubuntu setup script completed.'
echo 'A system reboot is required to apply some of these updates.'
