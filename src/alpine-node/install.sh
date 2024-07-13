#!/bin/sh

set -e

echo "Activating feature 'alpine-node'"

apk --no-cache add nodejs npm

if [[ $COREPACK == "true" ]]; then
  npm i -g corepack

  su -c "corepack prepare pnpm@$PNPMVERSION --activate" $_CONTAINER_USER
fi

if [[ -n "$GLOBALPACKAGES" ]]; then
  npm i -g $GLOBALPACKAGES
fi

npm i -g @antfu/ni

echo 'Done!'