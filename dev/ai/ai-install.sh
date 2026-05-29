#!/usr/bin/env bash
#
#
# Install AI Code Generation tools
#  - Run via: bash ./bin/ai-install.sh
#  - Or run via: just ai-install
#  - Uses the first-party suggested installation method for Linux/macOS
#
#

REPO_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
cd "$REPO_DIR"

echo '⏳ Installing Google Antigravity CLI'
curl -fsSL https://antigravity.google/cli/install.sh | bash

echo '⏳ Installing OpenAI Codex CLI'
brew install codex

echo '⏳ Installing Claude Code CLI'
curl -fsSL https://claude.ai/install.sh | bash

echo '⏳ Installing GitHub Copilot CLI'
curl -fsSL https://gh.io/copilot-install | bash
