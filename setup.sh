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

# Run the setup script for the Atom subfolder
cd Atom
sh setup.sh

# Apply the changes to all terminal sessions
sudo cp ~/.bashrc ~/.bashrc.bak
echo '. ~/.bash_aliases' >> ~/.bashrc
echo '. ~/.bash_prompt' >> ~/.bashrc
. ~/.bash_aliases
. ~/.bash_prompt
