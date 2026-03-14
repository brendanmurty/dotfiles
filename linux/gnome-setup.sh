#!/usr/bin/env bash
#
#
# Setup Gnome
#   - Tested on Ubuntu 24
#   - Customises Gnome settings for the current user
#
#

# Theme

gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background picture-uri-dark ''
gsettings set org.gnome.desktop.background primary-color '#374a49'
gsettings set org.gnome.shell.ubuntu color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-prussiangreen-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-prussiangreen'
gsettings set org.gnome.desktop.interface toolbar-icons-size 'large'

# Window management

gsettings set org.gnome.shell.window-switcher app-icon-mode 'both'
gsettings set org.gnome.shell.window-switcher current-workspace-only true
gsettings set org.gnome.mutter attach-modal-dialogs true
gsettings set org.gnome.mutter auto-maximize false
gsettings set org.gnome.mutter center-new-windows false
gsettings set org.gnome.mutter dynamic-workspaces true
gsettings set org.gnome.mutter edge-tiling false

# Extensions

gsettings set org.gnome.shell allow-extension-installation true
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell always-show-log-out true
gsettings set org.gnome.shell development-tools true

# Extension: Ubuntu Tiling Assistant

gsettings set org.gnome.shell.extensions.tiling-assistant enable-raise-tile-group false
gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup false
gsettings set org.gnome.shell.extensions.tiling-assistant tiling-popup-all-workspace false
gsettings set org.gnome.shell.extensions.tiling-assistant enable-tile-animations true
gsettings set org.gnome.shell.extensions.tiling-assistant enable-untile-animations true
gsettings set org.gnome.shell.extensions.tiling-assistant toggle-tiling-popup "[]"
gsettings set org.gnome.shell.extensions.tiling-assistant overridden-settings "{'org.gnome.mutter.edge-tiling': <false>}"
gsettings set org.gnome.shell.extensions.tiling-assistant restore-window "['<Super>Down']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-left-half "['<Super>Left', '<Super>KP_4']"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-right-half "['<Super>Right', '<Super>KP_6']"


# App: Nautilus

gsettings set org.gnome.nautilus.window-state initial-size "(1350, 1200)"
gsettings set org.gnome.nautilus.window-state maximized false
gsettings set org.gnome.nautilus.icon-view captions "['type', 'size', 'date_modified']"
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'medium'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'icon-view'
gsettings set org.gnome.nautilus.preferences default-sort-order 'name'
gsettings set org.gnome.nautilus.preferences show-create-link true
gsettings set org.gnome.nautilus.preferences show-directory-item-counts 'local-only'
gsettings set org.gnome.nautilus.preferences date-time-format 'simple'
gsettings set org.gnome.nautilus.compression default-compression-format 'zip'
gsettings set org.gnome.nautilus.preferences search-filter-time-type 'last_modified'
gsettings set org.gnome.nautilus.preferences install-mime-activation true
gsettings set org.gnome.nautilus.preferences open-folder-on-dnd-hover false
gsettings set org.gnome.nautilus.preferences click-policy 'double'

# Keyboard shortcuts

gsettings set org.gnome.shell.keybindings toggle-overview "['<Control><Super>Up']"
gsettings set org.gnome.shell.keybindings screenshot "[]"
gsettings set org.gnome.shell.keybindings screenshot-window "[]"
gsettings set org.gnome.shell.keybindings show-screen-recording-ui "[]"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print']"
gsettings set org.gnome.shell.keybindings toggle-quick-settings "['<Super>s']"

# Date and Time

gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-date true

# Hardware

gsettings set org.gnome.desktop.media-handling automount true
gsettings set org.gnome.desktop.media-handling automount-open false
gsettings set org.gnome.desktop.media-handling autorun-never true
gsettings set org.gnome.desktop.peripherals.touchpad accel-profile 'flat'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false

# Privacy

gsettings set org.gnome.desktop.notifications show-in-lock-screen false
gsettings set org.gnome.desktop.privacy usb-protection true
gsettings set org.gnome.desktop.privacy usb-protection-level 'lockscreen'
gsettings set org.gnome.desktop.privacy show-full-name-in-top-bar false
gsettings set org.gnome.desktop.privacy send-software-usage-stats false
gsettings set org.gnome.desktop.privacy report-technical-problems false
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.privacy old-files-age '7'
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.privacy recent-files-max-age '-1'
gsettings set org.gnome.system.location enabled false
gsettings set org.gnome.system.location max-accuracy-level 'neighborhood'
gsettings set org.gnome.clocks geolocation false
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.screensaver lock-delay '0'
gsettings set org.gnome.desktop.screensaver show-full-name-in-top-bar false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true
gsettings set org.gnome.desktop.screensaver user-switch-enabled true
gsettings set org.gnome.shell always-show-log-out true

# Power and performance

gsettings set org.gnome.shell last-selected-power-profile 'performance'

# App: TextEditor

gsettings set org.gnome.TextEditor auto-indent true
gsettings set org.gnome.TextEditor highlight-current-line true
gsettings set org.gnome.TextEditor highlight-matching-brackets true
gsettings set org.gnome.TextEditor indent-style 'space'
gsettings set org.gnome.TextEditor indent-width '2'
gsettings set org.gnome.TextEditor tab-width '2'
gsettings set org.gnome.TextEditor spellcheck false
gsettings set org.gnome.TextEditor use-system-font true
gsettings set org.gnome.TextEditor custom-font 'Monospace 11'
gsettings set org.gnome.TextEditor wrap-text true

# App: Tweaks

gsettings set org.gnome.tweaks show-extensions-notice false

# App: Settings

gsettings set org.gnome.Settings show-development-warning false
gsettings set org.gnome.Settings last-panel 'system'
gsettings set org.gnome.Settings window-state "(1250, 960, false)"
