# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install the Homebrew packages defined in "Brewfile"
brew bundle

# Install and activate the latest version of Node
nvm install node
nvm use node

# Setup a simple customised Zsh terminal prompt
cp ~/.zshrc ~/.zshrc.bak
cp .zshrc ~/.zshrc
