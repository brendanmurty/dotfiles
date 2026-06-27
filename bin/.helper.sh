#!/usr/bin/env bash
#
#
# Bash script helper functions
#
#

info() { echo -e "\033[1;36mi\u2009\033[0m$1"; }
success() { echo -e "\033[1;32m✔\u2009\033[0m$1"; }
warn() { echo -e "\033[1;33m!\u2009\033[0m$1"; }
error() { echo -e "\033[1;31m✗\u2009\033[0m$1"; }

# Returns the name of the Operating System
os() {
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
}

# Returns the name of the Operating System, lowercase and with dashes instead of spaces
os_clean() {
  echo "$(os | tr '[:upper:]' '[:lower:]' | tr ' ' '-')";
}
