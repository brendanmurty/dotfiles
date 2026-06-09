#!/usr/bin/env bash
#
#
# Docker setup
#
#

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"
BIN="$REPO/bin"

if [[ "$OS" != "EndeavourOS" && "$OS" != "Fedora" && "$OS" != "Ubuntu" ]]; then
  error "This script requires EndeavourOS, Fedora or Ubuntu."
  exit 0
elif [[ "$OS" == "EndeavourOS" ]]; then
  info "Requesting sudo"
  sudo -v

	info "Installing Docker packages"
  yay -Syu --noconfirm \
    docker \
    docker-rootless-extras \
    docker-desktop
elif [[ "$OS" == "Fedora" ]]; then
  # Request Sudo
  sudo -v

  # Install Docker CLI
  sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
  sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo systemctl enable --now docker

  # Setup Docker
  sudo groupadd docker
  sudo usermod -aG docker $USER

  # Install Docker Desktop
  DOCKER_RPM="$HOME/Downloads/temp-docker-desktop-x86_64.rpm"
  rm -rf "$DOCKER_RPM"
  curl --output "$DOCKER_RPM" "https://desktop.docker.com/linux/main/amd64/docker-desktop-x86_64.rpm"
  sudo dnf -y install "$DOCKER_RPM"
  rm -rf "$DOCKER_RPM"
elif [[ "$OS" == "Ubuntu" ]]; then
  # Request Sudo
  sudo -v

  # Add the Docker packages repository and official GPG key
  sudo apt update -qq
  sudo apt install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources
  sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

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
fi
