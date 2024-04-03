#!/bin/sh

set -e

echo "Activating feature 'alpine-magento-cloud-cli'"

apk --no-cache add curl

CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)

CMD="cd $_CONTAINER_USER_HOME && curl -sS https://accounts.magento.cloud/cli/installer | php"

if command -v zsh &> /dev/null; then
    CMD="$CMD -- --shell-type zsh"
fi

su -c "$CMD" $CURRENT_USER

echo 'Done!'