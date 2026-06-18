#!/usr/bin/env bash
#
#
# Lore version control setup - https://lore.org/
#
#

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"
source "$REPO/bin/.helper.sh"
OS="$(os)"

info "Installing Lore server"
# From https://epicgames.github.io/lore/how-to/install-lore-cli/#install-the-prebuilt-binary
curl -fsSL https://raw.githubusercontent.com/EpicGames/lore/main/scripts/install.sh | bash

info "Loading '$HOME/.bashrc' to apply changes to this session"
source "$HOME/.bashrc"

info "Installing Lore shell completions for Bash"
# From https://epicgames.github.io/lore/how-to/install-lore-cli/#install-shell-completions-optional
mkdir -p "$HOME/.local/share/bash-completion/completions"
lore completions bash > "$HOME/.local/share/bash-completion/completions/lore"
