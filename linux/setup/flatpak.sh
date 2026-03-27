#!/usr/bin/env bash
#
#
# Flatpak setup
#
#

LIB="$(cd "$(dirname "$0")" && cd ../lib && pwd)"
OS_NAME="$(bash $LIB/get-os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
elif [[ "$OS_NAME" == "Ubuntu" ]]; then
  sudo apt -qq --assume-yes install flatpak gnome-software-plugin-flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
elif [[ "$OS_NAME" == "EndeavourOS" ]]; then
  sudo pacman -Syu
  sudo pacman -S flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
else
  echo "Please setup Flatpak manually for your OS: https://flathub.org/en/setup"
  exit 0
fi

flatpak install io.github.kolunmi.Bazaar

flatpak install org.gnome.Calendar
flatpak install org.gnome.Extensions
flatpak install org.gnome.Boxes
flatpak install org.gnome.Loupe
flatpak install org.gnome.Logs
flatpak install org.gnome.seahorse.Application
flatpak install org.gnome.Weather
flatpak install org.gnome.baobab

flatpak install com.usebottles.bottles
flatpak install ca.desrt.dconf-editor
flatpak install io.missioncenter.MissionCenter
flatpak install com.github.tchx84.Flatseal

flatpak install org.gimp.GIMP
flatpak install org.libreoffice.LibreOffice

flatpak install dev.zed.Zed
flatpak install com.visualstudio.code

flatpak install com.discordapp.Discord
