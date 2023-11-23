#!/bin/sh

set -e

echo "Activating feature 'alpine-bottom'"

apk --no-cache add bottom

if [[ $INITZSH == "true" ]]; then
  apk --no-cache add bottom-zsh-completion
fi

echo 'Done!'