#!/bin/sh

set -e

echo "Activating feature 'alpine-php-sockets'"

docker-php-ext-install sockets

echo 'Done!'
