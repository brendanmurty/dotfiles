#!/usr/bin/env bash
#
#
# Docker setup
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" != "Ubuntu" ]]; then
  echo "This script requires Ubuntu."
  exit 0
fi

# Add the Docker packages list to system software repository

if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    [ -f /etc/apt/keyrings/docker.asc ] && sudo rm /etc/apt/keyrings/docker.asc
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo wget -qO /etc/apt/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
fi

# Install Docker and standard plugins

sudo apt update -qq
sudo apt -qq --assume-yes install \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin \
  docker-ce-rootless-extras

# Give this user privileged Docker access

sudo usermod -aG docker ${USER}

# Limit log size to avoid running out of disk

echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Install Docker Desktop

DOCKER_DEB="$HOME/Downloads/temp-docker-desktop-amd64.deb"

rm -rf "$DOCKER_DEB"
curl --output "$DOCKER_DEB" "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb"

sudo apt update -qq
sudo apt -qq --assume-yes install "$DOCKER_DEB"

rm -rf "$DOCKER_DEB"
