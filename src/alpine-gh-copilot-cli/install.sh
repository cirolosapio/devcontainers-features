#!/bin/sh

set -e

echo "Activating feature 'alpine-gh-copilot-cli'"

apk --no-cache add npm
npm i -g @githubnext/github-copilot-cli

if [[ $INITALIAS == "true" ]]; then
  CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)

  if [ -z "$_CONTAINER_USER_HOME" ]; then
    if [ -z "$CURRENT_USER" ]; then
      _CONTAINER_USER_HOME=/root
    else
      _CONTAINER_USER_HOME=$(getent passwd $CURRENT_USER | cut -d: -f6)
    fi
  fi

  if [[ -z $CURRENT_USER ]]; then
    echo 'eval "$(github-copilot-cli alias -- "$0")"' >> $_CONTAINER_USER_HOME/.zshrc
  else 
    CMD="echo 'eval \"\$(github-copilot-cli alias -- \"\$0\")\"' >> \$_CONTAINER_USER_HOME/.zshrc"
    su -c "$CMD" $CURRENT_USER
  fi
fi

echo 'Done!'