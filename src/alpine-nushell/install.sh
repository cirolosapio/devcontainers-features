#!/bin/sh

set -e

echo "Activating feature 'alpine-nushell'"

apk --no-cache add nushell

if [ -z "$_CONTAINER_USER_HOME" ]; then
  if [ -z "$_CONTAINER_USER" ]; then
    _CONTAINER_USER_HOME=/root
  else
    _CONTAINER_USER_HOME=$(getent passwd $_CONTAINER_USER | cut -d: -f6)
  fi
fi

mkdir -p $_CONTAINER_USER_HOME/.config/nushell/
# wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_config.nu -O $_CONTAINER_USER_HOME/.config/nushell/config.nu
# wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_env.nu -O $_CONTAINER_USER_HOME/.config/nushell/env.nu
wget -q https://raw.githubusercontent.com/nushell/nushell/2b5f1ee5b3e026e74f52983e47ce07f68a37fe34/crates/nu-utils/src/sample_config/default_config.nu -O $_CONTAINER_USER_HOME/.config/nushell/config.nu
wget -q https://raw.githubusercontent.com/nushell/nushell/2b5f1ee5b3e026e74f52983e47ce07f68a37fe34/crates/nu-utils/src/sample_config/default_env.nu -O $_CONTAINER_USER_HOME/.config/nushell/env.nu

if command -v starship &> /dev/null; then
  echo $'\nmkdir ~/.cache/starship\nstarship init nu | save -f ~/.cache/starship/init.nu' >> $_CONTAINER_USER_HOME/.config/nushell/env.nu
  echo $'\nuse ~/.cache/starship/init.nu' >> $_CONTAINER_USER_HOME/.config/nushell/config.nu
fi

if [ ! -z "$_CONTAINER_USER" ]; then
  chown -R $_CONTAINER_USER $_CONTAINER_USER_HOME/.config/nushell
fi

sed -i "s|:/bin/ash|:/usr/bin/nu|g" /etc/passwd
sed -i "s|:/bin/sh|:/usr/bin/nu|g" /etc/passwd

echo 'Done!'