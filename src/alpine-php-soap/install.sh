#!/bin/sh

set -e

echo "Activating feature 'alpine-php-soap'"

apk --no-cache add libxml2-dev
docker-php-ext-install soap

echo 'Done!'