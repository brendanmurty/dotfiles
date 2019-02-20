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

## Start Dropbox
open ~/Applications/Dropbox.app
