#!/bin/sh

set -e

echo "Activating feature 'alpine-php-pgsql'"

apk --no-cache add postgresql-dev
docker-php-ext-install pdo_pgsql

echo 'Done!'