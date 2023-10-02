#!/bin/sh

set -e

echo "Activating feature 'alpine-navi'"

apk --no-cache add skim
apk --no-cache add navi --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

if [[ $INITZSH == "true" ]]; then
  su $_CONTAINER_USER_NAME

  echo $'\neval "$(navi widget zsh)"' >> ~/.zshrc
fi

echo 'Done!'