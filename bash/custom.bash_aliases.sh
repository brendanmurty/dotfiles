# Custom command aliases

## Docker

alias docker-compose='docker compose'
alias dockerup='docker compose up -d'
alias dockerdown='docker compose down'
alias dockerps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}'"
alias dockerst="docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.Container}}'"

## Folder listing and searching

alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias lah='ls -lah'

## Cleaner bash command history

alias hist='history | cut -c 8-'
alias hist-search='history | cut -c 8- | grep'

## Return the public IPv4 address for the local machine

alias whatismyip='dig +short myip.opendns.com @resolver1.opendns.com'

## Others

alias python='python3'
alias pip='pip3'

alias zed='/usr/bin/zeditor'
