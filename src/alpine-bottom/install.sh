#!/bin/sh

set -e

echo "Activating feature 'alpine-bottom'"

apk --no-cache add bottom --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

if [[ $INITZSH == "true" ]]; then
  apk --no-cache add bottom-zsh-completion --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
fi

echo 'Done!'