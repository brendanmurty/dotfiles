# Setup a new macOS 10.x machine
# ----

# Install Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install main packages

brew cask install google-chrome atom dropbox

# Install Quick Look Plugins - https://github.com/sindresorhus/quick-look-plugins

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlvideo

# Start Dropbox

open ~/Applications/Dropbox.app
