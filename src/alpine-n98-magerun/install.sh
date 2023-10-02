#!/bin/sh

set -e

echo "Activating feature 'alpine-n98-magerun2'"

VERSION="${VERSION:-7.1.0}"

wget -q https://files.magerun.net/n98-magerun2-${VERSION}.phar -O /usr/local/bin/n98-magerun2.phar
# shasum -a256 n98-magerun2.phar
chmod +x /usr/local/bin/n98-magerun2.phar

if [[ $INITZSH == "true" ]]; then
  su $_CONTAINER_USER_NAME

  # ZSH PLUGIN
  mkdir -p ~/.oh-my-zsh/custom/plugins/n98-magerun2/
  wget -q https://raw.githubusercontent.com/netz98/n98-magerun2/develop/res/autocompletion/zsh/n98-magerun2.plugin.zsh -O ~/.oh-my-zsh/custom/plugins/n98-magerun2/n98-magerun2.plugin.zsh
  sed -i 's/^plugins=(/plugins=(\n  n98-magerun2/g' ~/.zshrc

  # ZSH ALIAS
  echo $'alias m=bin/magento' >> ~/.profile
  echo $'alias n=n98-magerun2.phar' >> ~/.profile
  echo $'alias sup="m s:up"' >> ~/.profile
  echo $'alias sdc="m s:d:c"' >> ~/.profile
  echo $'alias cf="n c:f"' >> ~/.profile
  echo $'alias reindex="n i:rei"' >> ~/.profile
  echo $'alias refresh=my/shs/refresh.sh' >> ~/.profile
  echo $'alias catalog="n dev:urn-catalog:generate .vscode/catalog_tmp.xml"' >> ~/.profile
fi

echo 'Done!'