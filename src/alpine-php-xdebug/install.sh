#!/bin/sh

set -e

echo "Activating feature 'alpine-php-xdebug'"

apk --no-cache add autoconf g++ linux-headers make
pecl install xdebug-$VERSION
docker-php-ext-enable xdebug

echo 'Done!'
