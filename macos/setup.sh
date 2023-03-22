# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install the Homebrew packages defined in "Brewfile"
brew bundle

# Setup Git autocomplete for branch names
mkdir ~/.zsh
curl -o ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# Setup a simple customised Zsh terminal prompt
cp ~/.zshrc ~/.zshrc.before-dotfiles-base.bak
cp .zshrc ~/.zshrc
