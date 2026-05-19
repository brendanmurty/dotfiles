#!/usr/bin/env bash
#
#
# Deno setup
#
#

SCRIPTS="$(cd "$(dirname "$0")" && cd ../scripts && pwd)"
OS_NAME="$(bash $SCRIPTS/os-name.sh)"

if [[ "$OS_NAME" == "Windows" ]]; then
  echo 'Please install Deno for Windows manually - https://deno.com/'
  exit 1
elif [[ "$OS_NAME" == "macOS" ]]; then
  # Install Deno for macOS, command from https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
else
  # Install Deno for Linux, command from https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
fi
