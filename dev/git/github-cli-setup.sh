#!/usr/bin/env bash
#
#
# GitHub CLI: Install and login
#   - More info at https://cli.github.com/
#
#

DIR="$(cd "$(dirname "$0")" && pwd)"

BIN="$(cd "$(dirname "$0")" && cd ../../bin && pwd)"
OS="$(bash $BIN/os.sh)"

if [[ "$OS" == "Windows" ]]; then
  echo "Requires Linux or macOS"
  exit 1
fi

# Install and configure GitHub CLI

brew reinstall gh

gh auth login --git-protocol ssh --skip-ssh-key --web

gh auth setup-git --hostname github.com

gh config set git_protocol ssh
gh config set editor vim
gh config set color_labels enabled
