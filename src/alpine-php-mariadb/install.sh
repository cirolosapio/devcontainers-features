#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mariadb'"

apk --no-cache add mariadb-client
docker-php-ext-install pdo_mysql
docker-php-ext-enable pdo_mysql

echo 'Done!'