#!/usr/bin/env bash
#
#
# Ubuntu initial setup
#   - Tested on Ubuntu 24
#
#

sudo apt update
sudo apt upgrade

sudo apt -y install curl zip git vim

sudo select-editor
sudo update-alternatives --config editor

sudo apt -y install gnome-shell gnome-shell-extensions gnome-tweaks

sudo apt -y install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

bash "./gnome-customise.sh"

echo 'Ubuntu setup script completed.'
echo 'A system reboot is required to apply some of these updates.'
