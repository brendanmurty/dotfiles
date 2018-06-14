# Custom commands and aliases
#
# Add the below three lines to "~/.bashrc" so that the aliases in this file are persisted after rebooting:
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# SSH configuration

eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

# Vagrant

alias vagrant-ssh='winpty vagrant ssh'
alias vagrant-reload='vagrant reload --provision'

# Docker

alias docker-up='docker-compose up -d'
alias docker-down='docker-compose down'

# List all files in a directory with human-readable file sizes

alias la='ll -ah'
