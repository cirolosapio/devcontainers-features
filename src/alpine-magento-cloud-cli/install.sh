#!/bin/sh

set -e

echo "Activating feature 'alpine-magento-cloud-cli'"

apk --no-cache add curl git

if [ -z "$_CONTAINER_USER_HOME" ]; then
	if [ -z "$_CONTAINER_USER" ]; then
		_CONTAINER_USER_HOME=/root
	else
		_CONTAINER_USER_HOME=$(getent passwd $_CONTAINER_USER | cut -d: -f6)
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

su -c "$CMD" $_CONTAINER_USER

echo 'Done!'