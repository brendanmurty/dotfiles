# Create the user configuration files if they aren't already there
touch ~/.bash_aliases ~/.bash_prompt ~/.gitconfig ~/.gitignore ~/.vimrc

# Backup the user configuration files before updating them
sudo cp ~/.bash_aliases ~/.bash_aliases.bak
sudo cp ~/.bash_prompt ~/.bash_prompt.bak
sudo cp ~/.gitconfig ~/.gitconfig.bak
sudo cp ~/.gitignore ~/.gitignore.bak
sudo cp ~/.vimrc ~/.vimrc.bak

# Append the customisations to the relevant user configuration files
cat custom.bash_aliases >> ~/.bash_aliases
cat custom.bash_prompt >> ~/.bash_prompt
cat custom.gitconfig >> ~/.gitconfig
cat custom.gitignore >> ~/.gitignore
cat custom.vimrc >> ~/.vimrc

# Apply the changes to the current terminal session
. ~/.bash_aliases
. ~/.bash_prompt

# Ensure the customisations are retained after the system is restarted
echo 'if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi' >> ~/.bashrc
echo 'if [ -f ~/.bash_prompt ]; then . ~/.bash_prompt; fi' >> ~/.bashrc

# Run the setup script for the Atom subfolder
cd Atom
sh setup.sh
