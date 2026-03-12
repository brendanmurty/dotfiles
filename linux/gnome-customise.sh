#!/usr/bin/env bash
#
#
# Customise Gnome settings
#   - Tested on Ubuntu 24
#
#

gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background picture-uri-dark ''
gsettings set org.gnome.desktop.background primary-color '#374a49'

gsettings set org.gnome.nautilus.icon-view captions "['type', 'size', 'date_modified']"
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'medium'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'icon-view'
gsettings set org.gnome.nautilus.preferences default-sort-order 'name'
gsettings set org.gnome.nautilus.preferences show-create-link true
gsettings set org.gnome.nautilus.preferences show-directory-item-counts 'local-only'
gsettings set org.gnome.nautilus.preferences date-time-format 'simple'

gsettings set org.gnome.nautilus.compression default-compression-format 'zip'

gsettings set org.gnome.system.location enabled false
gsettings set org.gnome.clocks geolocation false

gsettings set org.gnome.shell allow-extension-installation true
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell always-show-log-out true
gsettings set org.gnome.shell development-tools true

gsettings set org.gnome.shell last-selected-power-profile 'performance'

gsettings set org.gnome.shell.ubuntu color-scheme 'prefer-dark'
