# Install Atom packages
apm install --packages-file packages.txt

# Create the Atom configuration files if they aren't already there
touch ~/.atom/config.cson ~/.atom/init.coffee ~/.atom/keymap.cson ~/.atom/snippets.cson ~/.atom/styles.less

# Backup the current Atom configuration files
cp ~/.atom/config.cson ~/.atom/config.cson.bak
cp ~/.atom/init.coffee ~/.atom/init.coffee.bak
cp ~/.atom/keymap.cson ~/.atom/keymap.cson.bak
cp ~/.atom/snippets.cson ~/.atom/snippets.cson.bak
cp ~/.atom/styles.less ~/.atom/styles.less.bak

# Copy over the customised Atom configuration files
cp config.cson ~/.atom
cp init.coffee ~/.atom
cp keymap.cson ~/.atom
cp snippets.cson ~/.atom
cp styles.less ~/.atom
