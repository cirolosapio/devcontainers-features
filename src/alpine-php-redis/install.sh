#!/bin/sh

set -e

echo "Activating feature 'alpine-php-redis'"

apk --no-cache add autoconf g++ make
pecl install redis
docker-php-ext-enable redis

echo 'Done!'
