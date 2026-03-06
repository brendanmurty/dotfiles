# Safely apply customised configuration files

touch "$HOME/.bash_aliases" "$HOME/.bash_profile" "$HOME/.bash_prompt"

# Create backups of current Bash config files for this user

cp "$HOME/.bash_aliases" "$HOME/.bash_aliases.before-dotfiles.bak"
cp "$HOME/.bash_profile" "$HOME/.bash_profile.before-dotfiles.bak"
cp "$HOME/.bash_prompt" "$HOME/.bash_prompt.before-dotfiles.bak"

# Download the '__git_ps1' script from the official Git repo

curl --output "$HOME/.git-prompt.sh" https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh
source "$HOME/.git-prompt.sh"

# Copy over the customised Bash config files

cp "./custom.bash_aliases.sh" "$HOME/.bash_aliases"
cp "./custom.bash_profile.sh" "$HOME/.bash_profile"
cp "./custom.bash_prompt.sh" "$HOME/.bash_prompt"

# Load them in to the current terminal session

source "$HOME/.bash_profile"
