# Custom command aliases

## Docker

alias docker-compose='docker compose'
alias dockerup='docker compose up -d'
alias dockerdown='docker compose down'
alias dockerps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}'"
alias dockerst="docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.Container}}'"

## List all files in a directory with human-readable file sizes

alias la='ls -lah'

## Cleaner bash command history

alias hist='history | cut -c 8-'

## Return the public IPv4 address for the local machine

alias whatismyip='dig +short myip.opendns.com @resolver1.opendns.com'

## Python

alias python='python3'
alias pip='pip3'
