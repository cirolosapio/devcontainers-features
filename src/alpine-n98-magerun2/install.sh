#!/bin/sh

set -e

echo "Activating feature 'alpine-n98-magerun2'"

wget -q https://files.magerun.net/n98-magerun2-${VERSION}.phar -O /usr/local/bin/n98-magerun2.phar
# shasum -a256 n98-magerun2.phar
chmod +x /usr/local/bin/n98-magerun2.phar

if command -v zsh &> /dev/null; then
  if [ -z "$_CONTAINER_USER_HOME" ]; then
    CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)
    
    if [ -z "$CURRENT_USER" ]; then
      _CONTAINER_USER_HOME=/root
    else
      _CONTAINER_USER_HOME=$(getent passwd $CURRENT_USER | cut -d: -f6)
    fi
  fi

  # ZSH PLUGIN
  mkdir -p $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/n98-magerun2/
  wget -q https://raw.githubusercontent.com/netz98/n98-magerun2/develop/res/autocompletion/zsh/n98-magerun2.plugin.zsh -O $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/n98-magerun2/n98-magerun2.plugin.zsh
  sed -i 's/^plugins=(/plugins=(\n  n98-magerun2/g' $_CONTAINER_USER_HOME/.zshrc

  # ZSH ALIAS
  echo $'alias m=bin/magento' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias n=n98-magerun2.phar' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias sup="m s:up"' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias sdc="m s:d:c"' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias ssd="n se:s:d"' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias cac="n ca:cl"' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias caf="n c:f"' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias cf="n c:f"' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias reindex="n i:rei"' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'alias catalog="n dev:urn-catalog:generate .vscode/catalog_tmp.xml"' >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'