# Safely apply customised configuration file

touch ~/.gitconfig

cp ~/.gitconfig ~/.gitconfig.before-dotfiles.bak

cat custom.gitconfig >> ~/.gitconfig
