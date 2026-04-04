#!/usr/bin/env bash
#
#
# Helper script that returns the name of the OS
#
#

OS_NAME="$(uname -s)"

if [ "${OS_NAME}" == 'Linux' ]; then
  echo "$(source /etc/os-release && echo $NAME)"
elif [ "${OS_NAME}" == 'Freedesktop SDK' ]; then
  echo "$(lsb_release -si 2>/dev/null)"
elif [ "${OS_NAME}" == 'Darwin' ]; then
  echo 'macOS'
elif [ "${OS_NAME}" == 'CYGWIN' ]; then
  echo 'Windows'
elif [ "${OS_NAME}" == 'MINGW' ]; then
  echo 'Windows'
elif [ "${OS_NAME}" == 'MSYS_NT' ]; then
  echo 'Windows'
else
  echo "${OS_NAME}"
fi
