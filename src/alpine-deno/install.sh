#!/bin/sh

set -e

echo "Activating feature 'alpine-deno'"

apk --no-cache add deno --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

if [[ $INITZSH == "true" ]]; then
  apk --no-cache add deno-zsh-completion --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
fi

echo 'Done!'