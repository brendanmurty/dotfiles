#!/usr/bin/env bash
#
#
# Helper script that returns the name of the Operating System
#
#

OS="$(uname -s)";
if [[ "$OS" == 'Freedesktop SDK' ]]; then
  echo 'Linux';
elif [[ "$OS" == 'Linux' ]]; then
  DISTRO_NAME="$(source /etc/os-release && echo $NAME)";
  if [[ "$DISTRO_NAME" == 'Fedora Linux' ]]; then
    echo 'Fedora';
  elif [[ "$DISTRO_NAME" == 'Debian GNU/Linux' ]]; then
    echo 'Debian';
  else
    echo "${DISTRO_NAME}";
  fi
elif [[ "$OS" == 'Darwin' ]]; then
  echo 'macOS';
elif [[ "$OS" == 'CYGWIN' || "$OS" == 'MINGW' || "$OS" == 'MSYS_NT' ]]; then
  echo 'Windows';
else
  echo "${OS}";
fi
