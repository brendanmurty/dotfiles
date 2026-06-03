#!/usr/bin/env bash
#
#
# Caddy setup - more info at https://caddyserver.com/docs/
#
#

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

if [[ "$OS" == "Windows" ]] | [[ "$OS" == "macOS" ]]; then
  error 'This script requires Linux';
  exit 1
fi

warn 'Requesting sudo'

sudo -v

if command -v caddy >/dev/null 2>&1 ; then
  success 'Caddy is already installed'
else
  if [[ "$OS" == "Debian" ]] | [[ "$OS" == "Ubuntu" ]]; then
    info 'Installing Caddy'

    # From https://caddyserver.com/docs/install#debian-ubuntu-raspbian
    sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl > /dev/null 2>&1
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg > /dev/null 2>&1
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list > /dev/null 2>&1
    sudo chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg > /dev/null 2>&1
    sudo chmod o+r /etc/apt/sources.list.d/caddy-stable.list > /dev/null 2>&1
    sudo apt update > /dev/null 2>&1
    sudo apt install caddy > /dev/null 2>&1
  elif [[ "$OS" == "Fedora" ]]; then
    info 'Installing Caddy'

    # From https://caddyserver.com/docs/install#fedora-redhat-centos
    dnf install -y dnf5-plugins > /dev/null 2>&1
    dnf copr enable @caddy/caddy > /dev/null 2>&1
    dnf install -y caddy > /dev/null 2>&1
  fi
fi

warn 'Allowing Caddy to use port 443'
sudo setcap cap_net_bind_service=+ep $(which caddy)

success 'Caddy setup completed'