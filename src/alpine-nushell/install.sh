#!/bin/sh

set -e

echo "Activating feature 'alpine-nushell'"

apk --no-cache add nushell --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

su $_CONTAINER_USER_NAME

mkdir -p ~/.config/nushell/
wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_config.nu -O ~/.config/nushell/config.nu
wget -q https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config/default_env.nu -O ~/.config/nushell/env.nu

if [[ $INITSTARSHIP == "true" ]]; then
  echo $'\nmkdir ~/.cache/starship\nstarship init nu | save -f ~/.cache/starship/init.nu' >> ~/.config/nushell/env.nu
  echo $'\nsource ~/.cache/starship/init.nu' >> ~/.config/nushell/config.nu
fi

echo 'Done!'