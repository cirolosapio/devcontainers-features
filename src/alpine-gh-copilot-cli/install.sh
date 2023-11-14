#!/bin/sh

set -e

echo "Activating feature 'alpine-gh-copilot-cli'"

apk --no-cache add npm
npm i -g @githubnext/github-copilot-cli

if [[ $INITALIAS == "true" ]]; then
  CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
  echo "CURRENT_USER is $CURRENT_USER"
  
  if [[ -z $CURRENT_USER ]]; then
    echo 'eval "$(github-copilot-cli alias -- "$0")"' >> $_CONTAINER_USER_HOME/.zshrc
  else 
    su -c "echo 'eval "$(github-copilot-cli alias -- "$0")"' >> $_CONTAINER_USER_HOME/.zshrc" $CURRENT_USER
  fi
fi

echo 'Done!'