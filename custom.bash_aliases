#!/usr/bin/env bash

# Custom shell commands and aliases

## SSH configuration

eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

## System Maintenance

### Apply new package updates and remove out-of-date packages

alias update-system='sudo apt update && sudo apt -y upgrade && sudo apt autoremove && sudo apt autoclean'

## General

### Vagrant

alias vagrant-ssh='winpty vagrant ssh'
alias vagrant-reload='vagrant reload --provision'

### Docker

alias docker-up='docker-compose up -d'
alias docker-down='docker-compose down'

### List all files in a directory with human-readable file sizes

alias la='ll -ah'
