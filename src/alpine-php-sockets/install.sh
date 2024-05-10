#!/bin/sh

set -e

echo "Activating feature 'alpine-php-sockets'"

apk --no-cache add sockets
docker-php-ext-install sockets

echo 'Done!'
