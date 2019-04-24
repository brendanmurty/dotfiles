# Create the user configuration files if they aren't already there
touch ~/.bash_aliases ~/.bash_profile ~/.bash_prompt ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vimrc

# Backup the user configuration files before updating them
cp ~/.bash_aliases ~/.bash_aliases.before-dotfiles-base.bak
cp ~/.bash_prompt ~/.bash_prompt.before-dotfiles-base.bak
cp ~/.bashrc ~/.bashrc.before-dotfiles-base.bak
cp ~/.gitconfig ~/.gitconfig.before-dotfiles-base.bak
cp ~/.gitignore ~/.gitignore.before-dotfiles-base.bak
cp ~/.vimrc ~/.vimrc.before-dotfiles-base.bak

# Append the customisations to the relevant user configuration files
cat custom.bash_aliases >> ~/.bash_aliases
cat custom.bash_profile >> ~/.bash_profile
cat custom.bash_prompt >> ~/.bash_prompt
cat custom.gitconfig >> ~/.gitconfig
cat custom.gitignore >> ~/.gitignore
cat custom.vimrc >> ~/.vimrc

# Run the setup script for the Atom subfolder
cd atom
sh setup.sh
cd ..

# Apply the changes to all terminal sessions
echo '. ~/.bash_aliases' >> ~/.bashrc
echo '. ~/.bash_prompt' >> ~/.bashrc
echo '. ~/.bashrc' >> ~/.bash_profile
. ~/.bash_aliases
. ~/.bash_prompt
