touch ~/.bash_aliases ~/.bash_profile ~/.bash_prompt ~/.bashrc

cp ~/.bash_aliases ~/.bash_aliases.before-dotfiles-base.bak
cp ~/.bash_prompt ~/.bash_prompt.before-dotfiles-base.bak
cp ~/.bashrc ~/.bashrc.before-dotfiles-base.bak

cat custom.bash_aliases >> ~/.bash_aliases
cat custom.bash_prompt >> ~/.bash_prompt

echo '. ~/.bash_aliases' >> ~/.bashrc
echo '. ~/.bash_prompt' >> ~/.bashrc
echo '. ~/.bashrc' >> ~/.bash_profile
. ~/.bash_aliases
. ~/.bash_prompt
