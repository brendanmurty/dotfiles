# Setup a new machine for general development using Ubuntu 18.10
# ----

# Install Git, Vim, PHP and Node
sudo apt-get update
sudo apt-get install -y git vim php7.2 php7.2-cli php7.2-curl php7.2-mysql php7.2-mbstring php7.2-zip php7.2-xml nodejs

# Configure Git
git config --global core.editor vim
git config --global push.default simple
git config --global push.followTags true
git config --global core.autocrlf input

# Setup Composer 1.80 as a global command
wget https://raw.githubusercontent.com/composer/getcomposer.org/d3e09029468023aa4e9dcd165e9b6f43df0a9999/web/installer -O - -q | php -- --quiet
sudo mv composer.phar /usr/bin/composer

# Install Dropbox - from https://www.dropbox.com/install-linux
sudo dpkg -i "packages/dropbox_2018.11.28_amd64.deb"

# Install Google Chrome - from https://www.google.com/chrome/
sudo dpkg -i "packages/google-chrome-stable_current_amd64.deb"

# Install Atom - from https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update
sudo apt-get -y install atom

# Disable New Printer Added notifications
gsettings set org.gnome.settings-daemon.plugins.print-notifications active false

# Disable Device Connected notifications
gsettings set org.gnome.desktop.media-handling automount-open false

# Clean up packages
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt autoclean

# Reminder of the remaining manual steps
echo -e "Done! \n\n"
echo -e "Manual steps remaining: \n"
echo -e "- Setup symlinks for Git and Download files if needed \n"
echo -e "- Add local clones of relevant Git repositories \n"
echo -e "- Copy over relevant dotfiles to user directory \n"
echo -e "- Configure Chrome settings to minimise memory usage \n"
echo -e "- Add crontab entries for user folder backup scripts \n\n"
