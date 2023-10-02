#!/bin/sh

set -e

echo "Activating feature 'alpine-navi'"

apk --no-cache add skim
apk --no-cache add navi --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

if [[ $INITZSH == "true" ]]; then
  CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
  echo "Acting as $CURRENT_USER"
  su $CURRENT_USER

  echo $'\neval "$(navi widget zsh)"' >> ~/.zshrc
fi

echo 'Done!'