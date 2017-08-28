### SSH configuration

eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

### TodoTXT configuration

export TODOTXT_DEFAULT_ACTION=ls
alias t='/d/Dropbox/Tasks/App/todo.sh -d /d/Dropbox/Tasks/App/Brendan.cfg'
alias task='/d/Dropbox/Tasks/App/todo.sh -d /d/Dropbox/Tasks/App/Brendan.cfg'
alias todo='/d/Dropbox/Tasks/App/todo.sh -d /d/Dropbox/Tasks/App/Brendan.cfg'
