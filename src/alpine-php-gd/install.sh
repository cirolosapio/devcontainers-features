#!/bin/sh

set -e

echo "Activating feature 'alpine-php-gd'"

apk --no-cache add zlib-dev libpng-dev
docker-php-ext-install gd

echo 'Done!'
