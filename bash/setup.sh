# Safely apply customised configuration files

touch "$HOME/.bash_aliases" "$HOME/.bash_profile" "$HOME/.bash_prompt"

cp "$HOME/.bash_aliases" "$HOME/.bash_aliases.before-dotfiles.bak"
cp "$HOME/.bash_profile" "$HOME/.bash_profile.before-dotfiles.bak"
cp "$HOME/.bash_prompt" "$HOME/.bash_prompt.before-dotfiles.bak"

cp "./custom.bash_aliases.sh" "$HOME/.bash_aliases"
cp "./custom.bash_profile.sh" "$HOME/.bash_profile"
cp "./custom.bash_prompt.sh" "$HOME/.bash_prompt"

source "$HOME/.bash_profile"
