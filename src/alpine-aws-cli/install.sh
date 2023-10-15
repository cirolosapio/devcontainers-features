#!/bin/sh

set -e

echo "Activating feature 'alpine-aws-cli'"

apk --no-cache add aws-cli

if [[ $INITZSH == "true" ]]; then
  apk --no-cache add aws-cli-zsh-completion
fi

echo 'Done!'