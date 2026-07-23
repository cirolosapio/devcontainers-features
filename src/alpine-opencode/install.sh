#!/bin/sh

set -e

echo "Activating feature 'alpine-opencode'"

apk --no-cache add curl bash

CMD="curl -fsSL https://opencode.ai/install | bash"

su -c "$CMD" "$_CONTAINER_USER"

if [ -z "$_CONTAINER_USER_HOME" ]; then
  if [ -z "$_CONTAINER_USER" ]; then
    _CONTAINER_USER_HOME=/root
  else
    _CONTAINER_USER_HOME=$(getent passwd $_CONTAINER_USER | cut -d: -f6)
  fi
fi

ln -sf "$_CONTAINER_USER_HOME/.opencode/bin/opencode" /usr/local/bin/opencode

echo 'Done!'
