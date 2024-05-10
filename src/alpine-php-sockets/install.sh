#!/bin/sh

set -e

echo "Activating feature 'alpine-php-sockets'"

apk --no-cache add linux-headers
docker-php-ext-install sockets

echo 'Done!'
