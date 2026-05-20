#!/usr/bin/env bash
#
#
# Helper script that returns the name of the OS
#
#

OS_NAME="$(uname -s)";
if [[ "$OS_NAME" == 'Freedesktop SDK' ]]; then
  echo 'Linux';
elif [[ "$OS_NAME" == 'Linux' ]]; then
  DISTRO_NAME="$(source /etc/os-release && echo $NAME)";
  if [[ "$DISTRO_NAME" == 'Fedora' ]]; then
    echo 'Fedora';
  else
    echo "${DISTRO_NAME}";
  fi
elif [[ "$OS_NAME" == 'Darwin' ]]; then
  echo 'macOS';
elif [[ "$OS_NAME" == 'CYGWIN' || "$OS_NAME" == 'MINGW' || "$OS_NAME" == 'MSYS_NT' ]]; then
  echo 'Windows';
else
  echo "${OS_NAME}";
fi
