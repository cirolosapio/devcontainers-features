#!/bin/sh

set -e

echo "Activating feature 'alpine-node'"

apk --no-cache add nodejs npm

if [[ $COREPACK == "true" ]]; then
  npm i -g corepack

  if [[ $PNPMVERSION != "latest" ]]; then
    CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
    su -c "corepack prepare pnpm@$PNPMVERSION --activate" $CURRENT_USER
  fi
fi

if [[ $GLOBALPACKAGES != "" ]]; then
  npm i -g $GLOBALPACKAGES
fi

echo 'Done!'