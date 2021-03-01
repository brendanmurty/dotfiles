# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
brew install git
brew install gcc
brew install nvm
brew install zsh-completions
brew install --cask atom

# Setup custom Zsh prompt
npm install -g spaceship-prompt
