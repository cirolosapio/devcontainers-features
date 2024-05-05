#!/bin/sh

set -e

echo "Activating feature 'alpine-php-ftp'"

docker-php-ext-install ftp

echo 'Done!'
