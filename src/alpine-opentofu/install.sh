#!/bin/sh

set -e

echo "Activating feature 'alpine-opentofu'"

apk --no-cache add opentofu

if command -v zsh &> /dev/null; then
  sed -i 's/^plugins=(/plugins=(\n  opentofu/g' $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'
