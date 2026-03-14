#!/usr/bin/env bash
#
#
# Flatpak setup
#   - Tested on Ubuntu 24
#
#

sudo apt -y install flatpak gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub io.github.kolunmi.Bazaar
