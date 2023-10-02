#!/bin/sh

set -e

echo "Activating feature 'alpine-bat'"

apk --no-cache add bat

if [[ $INITZSH == "true" ]]; then
  apk --no-cache add bat-zsh-completion
  echo "alias cat=bat" >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'