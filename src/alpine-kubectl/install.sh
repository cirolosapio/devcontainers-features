#!/bin/sh

set -e

echo "Activating feature 'alpine-kubectl'"

apk --no-cache add kubectl

if command -v zsh &> /dev/null; then
  sed -i 's/^plugins=(/plugins=(\n  kubectl/g' $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'
