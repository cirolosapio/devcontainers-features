#!/bin/sh

set -e

echo "Activating feature 'alpine-node'"

apk --no-cache add nodejs npm

if [[ $COREPACK == "true" ]]; then
  npm i -g corepack
  corepack enable
fi

if [[ $ANTFUNI == "true" ]]; then
  npm i -g @antfu/ni
fi

if [[ $TSNODE == "true" ]]; then
  npm install -g typescript ts-node
fi

echo 'Done!'