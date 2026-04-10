#!/usr/bin/env bash
#
#
# Deno setup
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo "This script requires Linux or macOS."
  exit 0
elif [[ "$OS_NAME" == "macOS" ]]; then
  # Install Deno for macOS, command from https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
else
  # Install Deno for Linux, command from https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
fi
