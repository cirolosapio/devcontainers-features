#!/bin/sh

set -e

echo "Activating feature 'alpine-php-zip'"

apk --no-cache add libzip-dev
docker-php-ext-install zip

echo 'Done!'