#!/bin/sh

set -e

echo "Activating feature 'alpine-go'"

apk --no-cache add go

if command -v zsh &> /dev/null; then
  sed -i 's/^plugins=(/plugins=(\n  golang/g' $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'
