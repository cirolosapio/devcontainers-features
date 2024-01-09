#!/bin/sh

set -e

echo "Activating feature 'alpine-deno'"

apk --no-cache add deno

if [[ $INITZSH == "true" ]]; then
  apk --no-cache add deno-zsh-completion
fi

echo 'Done!'