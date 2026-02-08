# Safely apply customised configuration files

mkdir -p ~/.vim/syntax
touch ~/.vim/vimrc

cp ~/.vim ~/.vim-before-dotfiles
cp ~/.vim/vimrc ~/.vim/vimrc.before-dotfiles.bak

cp custom.vimrc ~/.vim/vimrc
