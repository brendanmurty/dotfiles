#!/usr/bin/env bash

# Custom shell commands and aliases

## Docker

alias dockerup='docker-compose up -d'
alias dockerdown='docker-compose down'
alias dockerps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Image}}'"
alias dockerst="docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.Container}}'"

## List all files in a directory with human-readable file sizes

alias la='ls -lah'
