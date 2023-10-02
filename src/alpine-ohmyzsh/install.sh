#!/bin/sh

set -e

echo "Activating feature 'alpine-ohmyzsh'"

apk --no-cache add git curl zsh

CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
su -c "curl -s https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s" $CURRENT_USER

git clone https://github.com/supercrabtree/k $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/k
git clone https://github.com/zsh-users/zsh-autosuggestions $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(\n  git\n  sudo\n  k\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n)/' $_CONTAINER_USER_HOME/.zshrc

if [[ $INITSTARSHIP == "true" ]]; then
  echo $'\neval "$(starship init zsh)"' >> $_CONTAINER_USER_HOME/.zshrc
fi

echo 'Done!'