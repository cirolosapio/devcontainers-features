#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mysql'"

apk --no-cache add mysql-client
docker-php-ext-install pdo_mysql
docker-php-ext-enable pdo_mysql

echo 'Done!'