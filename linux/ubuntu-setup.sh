#!/usr/bin/env bash
#
#
# Ubuntu initial setup
#   - Tested on Ubuntu 24
#
#

sudo apt update
sudo apt -y upgrade

sudo apt -y install \
    curl \
    zip \
    upzip \
    git \
    python3 \
    pipx \
    tmux \
    apt-transport-https \
    ca-certificates \
    libappindicator3-1 \
    software-properties-common \
    gnome-shell \
    gnome-shell-extensions \
    gnome-tweaks \
    flatpak \
    gnome-software-plugin-flatpak



flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

bash "./gnome-setup.sh"
bash "./bash-setup.sh"
bash "./homebrew-setup.sh"
bash "./vim-setup.sh"
bash "./tmux-setup.sh"
bash "./docker-setup.sh"

# Cleanup

sudo snap set system refresh.retain=2
sudo apt autoremove

echo 'Ubuntu setup script completed.'
echo 'A system reboot is required to apply some of these updates.'
