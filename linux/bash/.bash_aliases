#
#
# ~/.bash_aliases
#   - Custom command aliases
#
#

## Docker

if command -v docker >/dev/null 2>&1 ; then
  alias docker-compose='docker compose'
  alias docker-up='docker compose up -d'
  alias docker-down='docker compose down'
  alias docker-ps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}'"
  alias docker-st="docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.Container}}'"
fi

## Folder listing and searching

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lah='ls -lah'

## Cleaner bash command history

alias hist='history | cut -c 8-'
alias hist-search='history | cut -c 8- | grep'

## Zed Editor

if command -v zeditor >/dev/null 2>&1 ; then
  alias zed='zeditor'
fi

