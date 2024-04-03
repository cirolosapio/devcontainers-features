#!/bin/sh

set -e

echo "Activating feature 'alpine-php-posix'"

docker-php-ext-install posix

echo 'Done!'
