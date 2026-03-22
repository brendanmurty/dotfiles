#!/usr/bin/env bash
#
#
# Setup Gnome - Customise user level Gnome settings
#
#

LIB="$(cd "$(dirname "$0")" && cd ../lib && pwd)"
OS_NAME="$(bash $LIB/get-os-name.sh)"

if [[ "$OS_NAME" == "macOS" || "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux."
  exit 0
fi

# Theme

gsettings set org.gnome.desktop.background picture-uri 'none'
gsettings set org.gnome.desktop.background picture-uri-dark 'none'
gsettings set org.gnome.desktop.background primary-color '#374A49'
gsettings set org.gnome.desktop.interface accent-color '#308280'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.interface toolbar-icons-size 'large'
gsettings set org.gnome.desktop.interface toolbar-style 'text'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-size '24'
gsettings set org.gnome.desktop.interface monospace-font-name 'Hack  14'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans  14'
gsettings set org.gnome.desktop.interface font-name 'Noto Sans  10'
gsettings set org.gnome.desktop.wm.preferences audible-bell false
gsettings set org.gnome.desktop.wm.preferences visual-bell false
gsettings set org.gnome.desktop.wm.preferences visual-bell-type 'frame-flash'
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false


# Window management

gsettings set org.gnome.shell.window-switcher app-icon-mode 'both'
gsettings set org.gnome.shell.window-switcher current-workspace-only true
gsettings set org.gnome.mutter attach-modal-dialogs true
gsettings set org.gnome.mutter auto-maximize false
gsettings set org.gnome.mutter center-new-windows false
gsettings set org.gnome.mutter dynamic-workspaces true
gsettings set org.gnome.mutter edge-tiling true
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences theme 'Adwaita'
gsettings set org.gnome.desktop.wm.preferences button-layout 'icon:minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences num-workspaces '3'
gsettings set org.gnome.desktop.wm.preferences workspace-names '["Personal", "Work", "Games"]'
gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'toggle-maximize'
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'strict'
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button false
gsettings set org.gnome.desktop.wm.preferences focus-mode 'click'

# Extensions

gsettings set org.gnome.shell allow-extension-installation true
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell always-show-log-out true
gsettings set org.gnome.shell development-tools true

# Extension: Arc Menu

if gsettings list-schemas | grep "org.gnome.shell.extensions.arcmenu" >/dev/null 2>&1; then
  gsettings set org.gnome.shell.extensions.arcmenu application-shortcuts '[{"id": "io.missioncenter.MissionCenter.desktop"}, {"id": "org.gnome.Settings.desktop"}]'
  gsettings set org.gnome.shell.extensions.arcmenu apps-show-extra-details false
  gsettings set org.gnome.shell.extensions.arcmenu arcmenu-hotkey '["Super_L"]'
  gsettings set org.gnome.shell.extensions.arcmenu arcmenu-hotkey-overlay-key-enabled true
  gsettings set org.gnome.shell.extensions.arcmenu avatar-style 'Round'
  gsettings set org.gnome.shell.extensions.arcmenu az-layout-merge-panels true
  gsettings set org.gnome.shell.extensions.arcmenu button-item-icon-size 'Medium'
  gsettings set org.gnome.shell.extensions.arcmenu context-menu-items '[{"id": "org.gnome.Nautilus.desktop"}, {"id": "org.gnome.Console.desktop"}, {"name": "Separator", "icon": "list-remove-symbolic", "id": "ArcMenu_Separator"}, {"id": "eos-update.desktop", "name": "Update"}, {"id": "io.missioncenter.MissionCenter.desktop"}, {"id": "ArcMenu_Settings", "name": "Menu Settings", "icon": "ArcMenu_ArcMenuIcon"}, {"id": "ArcMenu_PanelExtensionSettings", "name": "Panel Extension Settings", "icon": "application-x-addon-symbolic"}, {"id": "ArcMenu_PowerOptions", "name": "Power Options", "icon": "system-shutdown-symbolic"}, {"id": "org.gnome.Settings.desktop"}]'
  gsettings set org.gnome.shell.extensions.arcmenu default-menu-view-runner 'Pinned_Apps'
  gsettings set org.gnome.shell.extensions.arcmenu directory-shortcuts '[{"id": "ArcMenu_Home", "name": "Home", "icon": "ArcMenu_Home"}, {"id": "ArcMenu_Downloads", "name": "Downloads", "icon": "ArcMenu_Downloads"}, {"name": "Drive", "icon": "inode-directory-symbolic", "id": "/home/murty/Drive"}, {"name": "Git", "icon": "inode-directory-symbolic", "id": "/home/murty/Git"}, {"name": "Games", "icon": "inode-directory-symbolic", "id": "/home/murty/Games"}]'
  gsettings set org.gnome.shell.extensions.arcmenu enable-horizontal-flip true
  gsettings set org.gnome.shell.extensions.arcmenu force-menu-location 'MonitorCentered'
  gsettings set org.gnome.shell.extensions.arcmenu group-apps-alphabetically-grid-layouts false
  gsettings set org.gnome.shell.extensions.arcmenu group-apps-alphabetically-list-layouts false
  gsettings set org.gnome.shell.extensions.arcmenu hide-overview-on-arcmenu-open true
  gsettings set org.gnome.shell.extensions.arcmenu hide-overview-on-startup true
  gsettings set org.gnome.shell.extensions.arcmenu hotkey-open-primary-monitor false
  gsettings set org.gnome.shell.extensions.arcmenu left-panel-width '600'
  gsettings set org.gnome.shell.extensions.arcmenu menu-background-color 'rgb(0,0,0)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-border-color 'rgb(51,51,51)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-border-radius '0'
  gsettings set org.gnome.shell.extensions.arcmenu menu-border-width '1'
  gsettings set org.gnome.shell.extensions.arcmenu menu-button-icon 'resource:///org/gnome/shell/extensions/arcmenu/icons/scalable/actions/distro-endeavouros.svg'
  gsettings set org.gnome.shell.extensions.arcmenu menu-button-icon-size '36'
  gsettings set org.gnome.shell.extensions.arcmenu menu-foreground-color 'rgb(223,223,223)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-height '550'
  gsettings set org.gnome.shell.extensions.arcmenu menu-item-active-bg-color 'rgb(143,240,164)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-item-active-fg-color 'rgb(0,0,0)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-item-category-icon-size 'Small'
  gsettings set org.gnome.shell.extensions.arcmenu menu-item-hover-bg-color 'rgb(143,240,164)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-item-hover-fg-color 'rgb(0,0,0)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-item-icon-size 'Medium'
  gsettings set org.gnome.shell.extensions.arcmenu menu-layout 'Default'
  gsettings set org.gnome.shell.extensions.arcmenu menu-separator-color 'rgb(51,51,51)'
  gsettings set org.gnome.shell.extensions.arcmenu menu-themes '[["Black and Teal", "rgb(0,0,0)", "rgb(223,223,223)", "rgb(51,51,51)", "1", "0", "11", "rgb(51,51,51)", "rgb(143,240,164)", "rgb(0,0,0)", "rgb(143,240,164)", "rgb(0,0,0)"], ["ArcMenu Style", "rgba(48,48,49,0.98)", "rgb(223,223,223)", "rgb(60,60,60)", "1", "14", "11", "rgba(255,255,255,0.1)", "rgb(21,83,158)", "rgb(255,255,255)", "rgb(25,98,163)", "rgb(255,255,255)"], ["Simply Dark", "rgba(28,28,28,0.98)", "rgb(211,218,227)", "rgb(63,62,64)", "1", "14", "11", "rgb(63,62,64)", "rgba(238,238,236,0.08)", "rgb(255,255,255)", "rgba(228,228,226,0.15)", "rgb(255,255,255)"], ["Dark Blue", "rgb(30,37,41)", "rgb(189,230,251)", "rgb(41,50,55)", "1", "14", "11", "rgba(99,99,98,0.56)", "rgba(189,230,251,0.08)", "rgb(189,230,251)", "rgba(189,230,251,0.15)", "rgb(189,230,251)"], ["Light Blue", "rgb(245,247,250)", "rgb(18,51,84)", "rgba(18,51,84,0.2)", "1", "14", "11", "rgba(18,51,84,0.15)", "rgba(18,51,84,0.08)", "rgb(18,51,84)", "rgba(18,51,84,0.15)", "rgb(18,51,84)"]]'
  gsettings set org.gnome.shell.extensions.arcmenu misc-item-icon-size 'Medium'
  gsettings set org.gnome.shell.extensions.arcmenu multi-monitor true
  gsettings set org.gnome.shell.extensions.arcmenu override-menu-theme true
  gsettings set org.gnome.shell.extensions.arcmenu pinned-apps '[{"id": "org.gnome.Nautilus.desktop"}, {"id": "google-chrome.desktop"}, {"id": "zen.desktop"}, {"id": "org.gnome.Terminal.desktop"}, {"id": "dev.zed.Zed.desktop"}, {"id": "io.podman_desktop.PodmanDesktop.desktop"}, {"id": "insync.desktop"}, {"id": "discord.desktop"}, {"id": "steam.desktop"}, {"id": "io.github.kolunmi.Bazaar.desktop"}, {"id": "org.gnome.DejaDup.desktop"}, {"id": "io.missioncenter.MissionCenter.desktop"}, {"id": "gnome-extensions prefs arcmenu@arcmenu.com", "name": "ArcMenu Settings", "icon": "ArcMenu_ArcMenuIcon"}, {"id": "org.gnome.Settings.desktop"}, {"id": "com.mitchellh.ghostty.desktop"}]'
  gsettings set org.gnome.shell.extensions.arcmenu power-display-style 'In_Line'
  gsettings set org.gnome.shell.extensions.arcmenu power-options '[(0, false), (1, true), (2, true), (3, true), (4, false), (5, false), (6, false), (7, false)]'
  gsettings set org.gnome.shell.extensions.arcmenu prefs-visible-page '0'
  gsettings set org.gnome.shell.extensions.arcmenu right-panel-width '200'
  gsettings set org.gnome.shell.extensions.arcmenu runner-menu-height '550'
  gsettings set org.gnome.shell.extensions.arcmenu runner-menu-height-static true
  gsettings set org.gnome.shell.extensions.arcmenu runner-menu-width '650'
  gsettings set org.gnome.shell.extensions.arcmenu runner-position 'Centered'
  gsettings set org.gnome.shell.extensions.arcmenu runner-search-display-style 'Grid'
  gsettings set org.gnome.shell.extensions.arcmenu runner-show-settings-button false
  gsettings set org.gnome.shell.extensions.arcmenu search-entry-border-radius '(true, 25)'
  gsettings set org.gnome.shell.extensions.arcmenu show-recently-installed-apps false
  gsettings set org.gnome.shell.extensions.arcmenu update-notifier-project-version '71'
  gsettings set org.gnome.shell.extensions.arcmenu vert-separator true
fi

# Extension: Dash to Panel

if gsettings list-schemas | grep "org.gnome.shell.extensions.dash-to-panel" >/dev/null 2>&1; then
  gsettings set org.gnome.shell.extensions.dash-to-panel animate-appicon-hover-animation-extent '{"RIPPLE": 4, "PLANK": 4, "SIMPLE": 1}'
  gsettings set org.gnome.shell.extensions.dash-to-panel appicon-margin '6'
  gsettings set org.gnome.shell.extensions.dash-to-panel appicon-padding '6'
  gsettings set org.gnome.shell.extensions.dash-to-panel appicon-style 'NORMAL'
  gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-dominant true
  gsettings set org.gnome.shell.extensions.dash-to-panel dot-color-override false
  gsettings set org.gnome.shell.extensions.dash-to-panel dot-position 'BOTTOM'
  gsettings set org.gnome.shell.extensions.dash-to-panel dot-size '0'
  gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-focused 'DOTS'
  gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-unfocused 'DOTS'
  gsettings set org.gnome.shell.extensions.dash-to-panel extension-version '73'
  gsettings set org.gnome.shell.extensions.dash-to-panel focus-highlight true
  gsettings set org.gnome.shell.extensions.dash-to-panel focus-highlight-dominant true
  gsettings set org.gnome.shell.extensions.dash-to-panel hide-overview-on-startup true
  gsettings set org.gnome.shell.extensions.dash-to-panel hotkeys-overlay-combo 'TEMPORARILY'
  gsettings set org.gnome.shell.extensions.dash-to-panel panel-anchors '{"LHC-0000000000000":"MIDDLE"}'
  gsettings set org.gnome.shell.extensions.dash-to-panel panel-element-positions '{"LHC-0000000000000":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedTL"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}'
  gsettings set org.gnome.shell.extensions.dash-to-panel panel-lengths '{}'
  gsettings set org.gnome.shell.extensions.dash-to-panel panel-positions '{}'
  gsettings set org.gnome.shell.extensions.dash-to-panel panel-sizes '{"LHC-0000000000000":48}'
  gsettings set org.gnome.shell.extensions.dash-to-panel panel-top-bottom-margins '0'
  gsettings set org.gnome.shell.extensions.dash-to-panel panel-top-bottom-padding '0'
  gsettings set org.gnome.shell.extensions.dash-to-panel prefs-opened true
  gsettings set org.gnome.shell.extensions.dash-to-panel trans-bg-color '#000000'
  gsettings set org.gnome.shell.extensions.dash-to-panel trans-border-custom-color 'rgb(51,51,51)'
  gsettings set org.gnome.shell.extensions.dash-to-panel trans-border-use-custom-color true
  gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-border true
  gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-bg true
  gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-title-position 'TOP'
fi

# App: Nautilus

gsettings set org.gnome.nautilus.window-state maximized false
gsettings set org.gnome.nautilus.icon-view captions '["type", "size", "date_modified"]'
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
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.nautilus.compression default-compression-format 'encrypted_zip'

# File lists

gsettings set org.gtk.gtk4.Settings.FileChooser sort-column 'name'
gsettings set org.gtk.gtk4.Settings.FileChooser sort-order 'ascending'
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.gtk4.Settings.FileChooser startup-mode 'cwd'
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true
gsettings set org.gtk.gtk4.Settings.FileChooser type-format 'category'
gsettings set org.gtk.gtk4.Settings.FileChooser view-type 'grid'
gsettings set org.gtk.gtk4.Settings.FileChooser clock-format '12h'
gsettings set org.gtk.gtk4.Settings.FileChooser show-size-column true
gsettings set org.gtk.gtk4.Settings.FileChooser show-type-column true

# Keyboard shortcuts

gsettings set org.gnome.shell.keybindings toggle-overview '["<Control><Super>Up"]'
gsettings set org.gnome.shell.keybindings screenshot '[]'
gsettings set org.gnome.shell.keybindings screenshot-window '[]'
gsettings set org.gnome.shell.keybindings show-screen-recording-ui '[]'
gsettings set org.gnome.shell.keybindings show-screenshot-ui '["Print"]'
gsettings set org.gnome.shell.keybindings toggle-quick-settings '["<Super>s"]'

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
gsettings set org.gnome.desktop.screensaver user-switch-enabled true
gsettings set org.gnome.shell always-show-log-out true

# Power and performance

if powerprofilesctl >/dev/null 2>&1; then
  powerprofilesctl set performance
fi

gsettings set org.gnome.shell last-selected-power-profile 'performance'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer", "variable-refresh-rate", "xwayland-native-scaling"]'

# App: Console

if gsettings list-schemas | grep "org.gnome.Console" >/dev/null 2>&1; then
  gsettings set org.gnome.Console audible-bell false
  gsettings set org.gnome.Console visual-bell false
  gsettings set org.gnome.Console custom-font 'Monospace 14'
  gsettings set org.gnome.Console use-system-font false
  gsettings set org.gnome.Console theme 'night'
  gsettings set org.gnome.Console shell '["/bin/bash"]'
  gsettings set org.gnome.Console scrollback-lines '10000'
  gsettings set org.gnome.Console transparency false
fi

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

# Ubuntu specific

if [[ "$OS_NAME" == "Ubuntu" ]]; then
  gsettings set org.gnome.shell.ubuntu color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
  gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-prussiangreen-dark'
  gsettings set org.gnome.desktop.interface icon-theme 'Yaru-prussiangreen'
  gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true

  if gsettings list-schemas | grep "org.gnome.shell.extensions.tiling-assistant" >/dev/null 2>&1; then
    gsettings set org.gnome.mutter edge-tiling false
    gsettings set org.gnome.shell.extensions.tiling-assistant enable-raise-tile-group false
    gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup false
    gsettings set org.gnome.shell.extensions.tiling-assistant tiling-popup-all-workspace false
    gsettings set org.gnome.shell.extensions.tiling-assistant enable-tile-animations true
    gsettings set org.gnome.shell.extensions.tiling-assistant enable-untile-animations true
    gsettings set org.gnome.shell.extensions.tiling-assistant toggle-tiling-popup '[]'
    gsettings set org.gnome.shell.extensions.tiling-assistant overridden-settings '{"org.gnome.mutter.edge-tiling": <false>}'
    gsettings set org.gnome.shell.extensions.tiling-assistant restore-window '["<Super>Down"]'
    gsettings set org.gnome.shell.extensions.tiling-assistant tile-left-half '["<Super>Left", "<Super>KP_4"]'
    gsettings set org.gnome.shell.extensions.tiling-assistant tile-right-half '["<Super>Right", "<Super>KP_6"]'
  fi
fi
