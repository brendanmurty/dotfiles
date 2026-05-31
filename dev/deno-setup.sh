#!/usr/bin/env bash
#
#
# Deno setup
#
#

BIN="$(cd "$(dirname "$0")" && cd ../bin && pwd)"
OS="$(bash $BIN/os-name.sh)"

if [[ "$OS" == "Windows" ]]; then
  echo 'Please install Deno for Windows manually - https://deno.com/'
  exit 1
elif [[ "$OS" == "macOS" ]]; then
  # Install Deno for macOS, command from https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
else
  # Install Deno for Linux, command from https://docs.deno.com/runtime/getting_started/installation/
  curl -fsSL https://deno.land/install.sh | sh
fi
