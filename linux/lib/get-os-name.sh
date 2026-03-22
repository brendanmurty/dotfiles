#!/usr/bin/env bash
#
#
# Linux Lib: Get formatted OS name
#
#

OS_NAME="$(uname -s)"

case "${OS_NAME}" in
    Linux*)     OS="$(source /etc/os-release && echo $NAME)";;
    Darwin*)    OS="macOS";;
    CYGWIN*)    OS="Windows";;
    MINGW*)     OS="Windows";;
    MSYS_NT*)   OS="Windows";;
    *)          OS="${OS_NAME}"
esac

echo "${OS}"
