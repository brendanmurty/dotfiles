#
#
# ~/.profile
#   - Loaded in login shells, skipped if ~/.bash_profile or ~/.bash_login
# exist
#   - See /usr/share/doc/bash/examples/startup-files for examples.
#
#

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi
