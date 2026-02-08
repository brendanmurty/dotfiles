# Safely apply customised configuration files

touch ~/.bash_aliases ~/.bash_profile ~/.bash_prompt

cp ~/.bash_aliases ~/.bash_aliases.before-dotfiles.bak
cp ~/.bash_prompt ~/.bash_prompt.before-dotfiles.bak

cat custom.bash_aliases >> ~/.bash_aliases
cat custom.bash_prompt >> ~/.bash_prompt

echo '. ~/.bash_aliases' >> ~/.bash_profile
echo '. ~/.bash_prompt' >> ~/.bash_profile

source ~/.bash_profile
