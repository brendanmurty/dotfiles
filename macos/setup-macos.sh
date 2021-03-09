# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install the packages defined in "Brewfile"
brew bundle

# Install the latest version of Node
nvm install node
nvm use node

# Setup custom Zsh terminal prompt
npm install -g spaceship-prompt
