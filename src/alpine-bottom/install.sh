#!/bin/sh

set -e

echo "Activating feature 'alpine-bottom'"

apk --no-cache add bottom

if command -v zsh &> /dev/null; then
  apk --no-cache add bottom-zsh-completion
fi

echo 'Done!'