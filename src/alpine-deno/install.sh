#!/bin/sh

set -e

echo "Activating feature 'alpine-deno'"

apk --no-cache add deno

if command -v zsh &> /dev/null; then
  apk --no-cache add deno-zsh-completion
fi

echo 'Done!'