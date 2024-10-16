#!/bin/sh

set -e

echo "Activating feature 'alpine-lazygit'"

apk --no-cache add lazygit

if command -v zsh &> /dev/null; then
  if [ -z "$_CONTAINER_USER_HOME" ]; then
    if [ -z "$_CONTAINER_USER" ]; then
      _CONTAINER_USER_HOME=/root
    else
      _CONTAINER_USER_HOME=$(getent passwd $_CONTAINER_USER | cut -d: -f6)
    fi
  fi

  echo $'\nalias lg=lazygit' >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'