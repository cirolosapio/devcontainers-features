#!/bin/sh

set -e

echo "Activating feature 'alpine-gh-copilot-cli'"

apk --no-cache add npm
npm i -g @githubnext/github-copilot-cli

if [[ $INITZSH == "true" ]]; then
  eval "$(github-copilot-cli alias -- "$0")"
fi

echo 'Done!'