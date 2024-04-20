#!/bin/sh

set -e

echo "Activating feature 'alpine-magento-cloud-cli'"

apk --no-cache add curl git

CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)

CMD="cd $_CONTAINER_USER_HOME && curl -sS https://accounts.magento.cloud/cli/installer | php"

if [ "$SHELLTYPE" = "zsh" ]; then
    apk --no-cache add zsh
    sed -i "s|:/bin/ash|:/bin/zsh|g" /etc/passwd
    CMD="$CMD -- --shell-type zsh"
else
    apk --no-cache add bash
    CMD="$CMD -- --shell-type bash"
fi

su -c "$CMD" $CURRENT_USER

echo 'Done!'