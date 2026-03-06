#!/usr/bin/env bash

# Restore Obsidian Configuration
#  - Makes a backup of your current Obsidian configuration directory
#  - Applies Obsidian configuration from the config directory here to your Obsidian vault

# Setup the message colour characters

blue="\033[0;34m"
green="\033[0;32m"
yellow="\033[0;33m"
red="\033[0;31m"
end="\033[0m"

# Location of the Obsidian vault configuration directory

CONFIG_DIR=$HOME"/Notes/.obsidian"

# Location of the backup directory

BACKUP_DIR=$HOME"/.obsidian-config_"$(date +%Y%m%d%H%M)

# Ask for confirmation from the user before continuing

read -p "$(echo -e $blue"This script will first backup, then apply Obsidian configuration files to your vault configuration directory at "$CONFIG_DIR". Please close Obsidian first. Continue this process? (y/n) "$end)" ANSWER
if [ "$ANSWER" != "y" ]; then
  echo -e "${red}User cancelled, restore aborted.${end}"
  exit 1
fi

# Backup current config files

echo -e "${yellow}Making backup of current config at $CONFIG_DIR to $BACKUP_DIR${end}"

mkdir -p $CONFIG_DIR

rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR
cp -r $CONFIG_DIR/* $BACKUP_DIR

# Restore config files

echo -e "${yellow}Restoring config files to $CONFIG_DIR${end}"

rm -rf $CONFIG_DIR
mkdir -p $CONFIG_DIR
cp -r config/* $CONFIG_DIR

# Done

echo -e "${green}Done. You can open Obsidian again now.${end}"