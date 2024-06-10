#!/bin/sh

set -e

echo "Activating feature 'alpine-magento-cloud-cli'"

apk --no-cache add curl git

CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)

if [ -z "$_CONTAINER_USER_HOME" ]; then
	if [ -z "$CURRENT_USER" ]; then
		_CONTAINER_USER_HOME=/root
	else
		_CONTAINER_USER_HOME=$(getent passwd $CURRENT_USER | cut -d: -f6)
	fi
fi

CMD="cd $_CONTAINER_USER_HOME && curl -sS https://accounts.magento.cloud/cli/installer | php"

if [ "$SHELLTYPE" = "zsh" ]; then
	apk --no-cache add zsh
	sed -i "s|:/bin/ash|:/bin/zsh|g" /etc/passwd
	sed -i "s|:/bin/sh|:/bin/zsh|g" /etc/passwd
	CMD="$CMD -- --shell-type zsh"
else
	apk --no-cache add bash
	CMD="$CMD -- --shell-type bash"
fi

su -c "$CMD" $CURRENT_USER

echo 'Done!'