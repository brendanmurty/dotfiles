# Setup a new macOS 10 device

## Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install application packages
brew cask install google-chrome atom dropbox

## Install development packages
brew install git node php@7.3

## Install Quick Look Plugins - https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlvideo

## Configure Git
git config --global core.editor vim
git config --global push.default simple
git config --global push.followTags true
git config --global core.autocrlf input

## Update system settings

### Close any open System Preferences panes, to prevent them from overriding the below changes
osascript -e 'tell application "System Preferences" to quit'

### Ask for the administrator password upfront
sudo -v

### Disable sound effects on boot
sudo nvram SystemAudioVolume=" "

### Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

### Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

### Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

### Remove duplicates in the Open With menu
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

### Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

### Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

### Disable automatic capitalisation
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

### Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

### Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

### Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

### Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 1

### Finder: Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

### Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

### Finder: Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

### Finder: Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

### Disable dock icon bouncing effect
defaults write com.apple.dock no-bouncing -bool FALSE

### Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 32

### Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

### Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

### Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

### Safari: Don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

### Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

### Enable automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

### Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

### Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

### Enable app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

### Chrome: Disable the backswipe gesture
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false

### Restart affected applications
killall "Dock" &> /dev/null
killall "Finder" &> /dev/null
killall "Google Chrome" &> /dev/null
killall "Safari" &> /dev/null
killall "SystemUIServer" &> /dev/null
killall "Terminal" &> /dev/null

### Finished
echo "System settings have been updated, a system restart is recommended."
