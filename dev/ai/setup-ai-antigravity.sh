#!/usr/bin/env bash
#
#
# Setup AI tool - Google Antigravity
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Fedora" ]]; then
  echo 'This script requires Fedora.'
  exit 0
fi

# Request Sudo
sudo -v

# Install Google Antigravity CLI
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Install Google Antigravity IDE
sudo tee /etc/yum.repos.d/antigravity.repo << EOL
[antigravity-rpm]
name=Antigravity RPM Repository
baseurl=https://us-central1-yum.pkg.dev/projects/antigravity-auto-updater-dev/antigravity-rpm
enabled=1
gpgcheck=0
EOL

sudo dnf install -y antigravity
