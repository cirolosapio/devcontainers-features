#!/bin/sh

set -e

echo "Activating feature 'alpine-navi'"

apk --no-cache add skim navi

if command -v zsh &> /dev/null; then
  if [ -z "$_CONTAINER_USER_HOME" ]; then
    CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)
    
    if [ -z "$CURRENT_USER" ]; then
      _CONTAINER_USER_HOME=/root
    else
      _CONTAINER_USER_HOME=$(getent passwd $CURRENT_USER | cut -d: -f6)
    fi
  fi

  echo $'\neval "$(navi widget zsh)"' >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'