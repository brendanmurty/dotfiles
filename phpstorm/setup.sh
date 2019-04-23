# Backup the current PHPStorm configuration files
cp -r ~/Library/Preferences/PhpStorm2019.1/ ~/Library/Preferences/PhpStorm2019.1.bak/

# Copy over the customised PHPStorm configuration files
mkdir -p ~/Library/Preferences/PhpStorm2019.1/codestyles
mkdir -p ~/Library/Preferences/PhpStorm2019.1/options
cp -r codestyles/* ~/Library/Preferences/PhpStorm2019.1/codestyles
cp -r options/* ~/Library/Preferences/PhpStorm2019.1/options
