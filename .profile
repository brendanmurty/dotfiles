### SSH configuration

eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

### Aliases to assist with development processes on Windows machines

alias vagrant-ssh='winpty vagrant ssh'
alias vagrant-reload='vagrant reload --provision'

alias docker-up='docker-compose up -d'
alias docker-down='docker-compose down'

alias la='ll -ah'
