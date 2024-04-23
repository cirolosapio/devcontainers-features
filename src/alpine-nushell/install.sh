#!/bin/sh

set -e

echo "Activating feature 'alpine-nushell'"

apk --no-cache add nushell --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

if [ -z "$_CONTAINER_USER_HOME" ]; then
  CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)

  if [ -z "$CURRENT_USER" ]; then
    _CONTAINER_USER_HOME=/root
  else
    _CONTAINER_USER_HOME=$(getent passwd $CURRENT_USER | cut -d: -f6)
  fi
fi

mkdir -p $_CONTAINER_USER_HOME/.config/nushell/
wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_config.nu -O $_CONTAINER_USER_HOME/.config/nushell/config.nu
wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_env.nu -O $_CONTAINER_USER_HOME/.config/nushell/env.nu

if command -v starship &> /dev/null; then
  echo $'\nmkdir ~/.cache/starship\nstarship init nu | save -f ~/.cache/starship/init.nu' >> $_CONTAINER_USER_HOME/.config/nushell/env.nu
  echo $'\nuse ~/.cache/starship/init.nu' >> $_CONTAINER_USER_HOME/.config/nushell/config.nu
fi

echo 'Done!'