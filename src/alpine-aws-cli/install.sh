#!/bin/sh

set -e

echo "Activating feature 'alpine-aws-cli'"

apk --no-cache add aws-cli

if command -v zsh &> /dev/null; then
  apk --no-cache add aws-cli-zsh-completion
fi

echo 'Done!'