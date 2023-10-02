#!/bin/sh

set -e

echo "Activating feature 'alpine-navi'"

apk --no-cache add skim navi

if [[ $INITZSH == "true" ]]; then
  echo $'\neval "$(navi widget zsh)"' >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'