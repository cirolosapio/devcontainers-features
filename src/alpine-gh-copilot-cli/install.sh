#!/bin/sh

set -e

echo "Activating feature 'alpine-gh-copilot-cli'"

apk --no-cache add npm
npm i -g @githubnext/github-copilot-cli

if command -v zsh &> /dev/null || command -v bash &> /dev/null; then
  if command -v zsh &> /dev/null; then
    RC_PROFILE=".zshrc"
  else
    RC_PROFILE=".bashrc"
  fi

  if [ -z "$_CONTAINER_USER_HOME" ]; then
    if [ -z "$_CONTAINER_USER" ]; then
      _CONTAINER_USER_HOME=/root
    else
      _CONTAINER_USER_HOME=$(getent passwd $_CONTAINER_USER | cut -d: -f6)
    fi
  fi

  if [[ -z $_CONTAINER_USER ]]; then
    echo 'eval "$(github-copilot-cli alias -- "$0")"' >> $_CONTAINER_USER_HOME/$RC_PROFILE
  else 
    CMD="echo 'eval \"\$(github-copilot-cli alias -- \"\$0\")\"' >> \$_CONTAINER_USER_HOME/$RC_PROFILE"
    su -c "$CMD" $_CONTAINER_USER
  fi
fi

echo 'Done!'