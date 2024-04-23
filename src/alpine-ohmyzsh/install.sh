#!/bin/sh

set -e

echo "Activating feature 'alpine-ohmyzsh'"

apk --no-cache add git zsh

CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)

if [ -z "$_CONTAINER_USER_HOME" ]; then
  if [ -z "$CURRENT_USER" ]; then
    _CONTAINER_USER_HOME=/root
  else
    _CONTAINER_USER_HOME=$(getent passwd $CURRENT_USER | cut -d: -f6)
  fi
fi

su -c "wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s" $CURRENT_USER

git clone https://github.com/zsh-users/zsh-autosuggestions $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n)/' $_CONTAINER_USER_HOME/.zshrc

if echo "$PLUGINS" | grep -w -q "autojump"; then
  git clone https://github.com/wting/autojump $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/autojump
  apk --no-cache add python3
  su -c "cd $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/autojump/ && SHELL=zsh && ./install.py" $CURRENT_USER
  echo $'\n[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh' >> $_CONTAINER_USER_HOME/.zshrc
  echo $'\nautoload -U compinit && compinit -u' >> $_CONTAINER_USER_HOME/.zshrc
fi

if echo "$PLUGINS" | grep -w -q "alias-tips"; then
  apk --no-cache add python3
  git clone https://github.com/djui/alias-tips $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/alias-tips
fi

if echo "$PLUGINS" | grep -w -q "zsh-interactive-cd"; then
  apk --no-cache add fzf
fi

for plugin in $PLUGINS; do
  sed -i "s/^plugins=(/plugins=(\n  $plugin/g" $_CONTAINER_USER_HOME/.zshrc
done

if command -v starship > /dev/null; then
  echo $'\neval "$(starship init zsh)"' >> $_CONTAINER_USER_HOME/.zshrc
fi

sed -i "s|:/bin/ash|:/bin/zsh|g" /etc/passwd

echo 'Done!'