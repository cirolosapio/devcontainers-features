#!/bin/sh

set -e

echo "Activating feature 'alpine-bottom'"

apk --no-cache add broot

if [[ $INITZSH == "true" ]]; then
  apk --no-cache add broot-zsh-completion
fi

echo 'Done!'