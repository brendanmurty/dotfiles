#!/usr/bin/env bash
#
#
# EndeavourOS: Setup system
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" != "EndeavourOS" ]]; then
  echo "This script requires EndeavourOS."
  exit 0
fi

info 'EndeavourOS: Requesting sudo access'
sudo -v

info 'EndeavourOS: Setup initial packages and Flatpak'

sudo pacman -Syu --noconfirm \
  gnome-software \
  gnome-tweaks \
  gnome-browser-connector \
  git \
  zip \
  flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

success 'EndeavourOS: Setup complete, a restart is required to apply changes to the system'

