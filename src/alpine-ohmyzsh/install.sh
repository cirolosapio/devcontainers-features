#!/bin/sh

set -e

echo "Activating feature 'alpine-ohmyzsh'"

apk --no-cache add git curl zsh

su $_CONTAINER_USER

curl -s https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s

git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(\n  git\n  sudo\n  k\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n)/' ~/.zshrc

if [[ $INITSTARSHIP == "true" ]]; then
  echo $'\neval "$(starship init zsh)"' >> ~/.zshrc
fi

echo 'Done!'