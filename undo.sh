# Revert to the previous versions of the user configuration files
mv ~/.bash_aliases.before-dotfiles-base.bak ~/.bash_aliases
mv ~/.bash_profile.before-dotfiles-base.bak ~/.bash_profile
mv ~/.bash_prompt.before-dotfiles-base.bak ~/.bash_prompt
mv ~/.bashrc.before-dotfiles-base.bak ~/.bashrc
mv ~/.gitconfig.before-dotfiles-base.bak ~/.gitconfig
mv ~/.gitignore.before-dotfiles-base.bak ~/.gitignore
mv ~/.vimrc.before-dotfiles-base.bak ~/.vimrc

# Apply the changes to all terminal sessions
. ~/.bash_aliases
. ~/.bash_prompt
