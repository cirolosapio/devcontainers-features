#!/bin/sh

set -e

echo "Activating feature 'alpine-node'"

apk --no-cache add nodejs npm

if [[ $COREPACK == "true" ]]; then
  npm i -g corepack

  CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)
  su -c "corepack use pnpm@$PNPMVERSION" $CURRENT_USER
fi

if [[ -n "$GLOBALPACKAGES" ]]; then
  npm i -g $GLOBALPACKAGES
fi

echo 'Done!'