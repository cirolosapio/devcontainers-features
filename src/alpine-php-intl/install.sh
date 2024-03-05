#!/bin/sh

set -e

echo "Activating feature 'alpine-php-intl'"

# apk --no-cache add libintl icu-dev
docker-php-ext-install intl

echo 'Done!'