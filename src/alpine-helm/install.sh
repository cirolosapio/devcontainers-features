#!/bin/sh

set -e

echo "Activating feature 'alpine-helm'"

apk --no-cache add helm

if command -v zsh &> /dev/null; then
  sed -i 's/^plugins=(/plugins=(\n  helm/g' $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'
