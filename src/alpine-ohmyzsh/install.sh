#!/bin/sh

set -e

echo "Activating feature 'alpine-ohmyzsh'"

apk --no-cache add git zsh

if [ -z "$PLUGINS" ]; then
  PLUGINS=$DEFAULTPLUGINS
else
  PLUGINS="$DEFAULTPLUGINS $PLUGINS"
fi

if [ -z "$_CONTAINER_USER_HOME" ]; then
  if [ -z "$_CONTAINER_USER" ]; then
    _CONTAINER_USER_HOME=/root
  else
    _CONTAINER_USER_HOME=$(getent passwd $_CONTAINER_USER | cut -d: -f6)
  fi
fi

su -c "wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s" $_CONTAINER_USER

sed -i 's/plugins=(git)/plugins=(\n)/' $_CONTAINER_USER_HOME/.zshrc

if echo "$PLUGINS" | grep -w -q "zsh-autosuggestions"; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if echo "$PLUGINS" | grep -w -q "zsh-syntax-highlighting"; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if echo "$PLUGINS" | grep -w -q "autoupdate"; then
  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/autoupdate
fi

if echo "$PLUGINS" | grep -w -q "autojump"; then
  git clone https://github.com/wting/autojump $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/autojump
  apk --no-cache add python3
  su -c "cd $_CONTAINER_USER_HOME/.oh-my-zsh/custom/plugins/autojump/ && SHELL=zsh && ./install.py" $_CONTAINER_USER
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
sed -i "s|:/bin/sh|:/bin/zsh|g" /etc/passwd

echo 'Done!'