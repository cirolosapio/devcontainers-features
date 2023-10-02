#!/bin/sh

set -e

echo "Activating feature 'alpine-navi'"

apk --no-cache add skim
apk --no-cache add navi --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

if [[ $INITZSH == "true" ]]; then
  echo $'\neval "$(navi widget zsh)"' >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'