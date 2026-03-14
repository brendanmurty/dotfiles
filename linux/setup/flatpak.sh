#!/usr/bin/env bash
#
#
# Flatpak setup
#
#

sudo apt -qq --assume-yes install flatpak gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub io.github.kolunmi.Bazaar
