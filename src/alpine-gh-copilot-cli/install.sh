#!/bin/sh

set -e

echo "Activating feature 'alpine-gh-copilot-cli'"

apk --no-cache add npm
npm i -g @githubnext/github-copilot-cli

if [[ $INITALIAS == "true" ]]; then
  echo 'eval "$(github-copilot-cli alias -- "$0")"' >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'