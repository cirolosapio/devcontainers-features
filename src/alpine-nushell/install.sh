#!/bin/sh

set -e

echo "Activating feature 'alpine-nushell'"

apk --no-cache add nushell --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

mkdir -p $_CONTAINER_USER_HOME/.config/nushell/
wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_config.nu -O $_CONTAINER_USER_HOME/.config/nushell/config.nu
wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_env.nu -O $_CONTAINER_USER_HOME/.config/nushell/env.nu


if [[ $INITSTARSHIP == "true" ]]; then
  echo $'\nmkdir ~/.cache/starship\nstarship init nu | save -f ~/.cache/starship/init.nu' >> $_CONTAINER_USER_HOME/.config/nushell/env.nu
  echo $'\nsource ~/.cache/starship/init.nu' >> $_CONTAINER_USER_HOME/.config/nushell/config.nu
fi

echo 'Done!'