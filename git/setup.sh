touch ~/.gitconfig ~/.gitignore

cp ~/.gitconfig ~/.gitconfig.before-dotfiles-base.bak
cp ~/.gitignore ~/.gitignore.before-dotfiles-base.bak

cat custom.gitconfig >> ~/.gitconfig
cat custom.gitignore >> ~/.gitignore
