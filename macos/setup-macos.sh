# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages defined in "Brewfile"
brew bundle

# Setup custom Zsh prompt
npm install -g spaceship-prompt

# Install the latest version of Node
nvm install node
nvm use node
