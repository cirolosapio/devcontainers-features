#!/bin/sh

set -e

echo "Activating feature 'alpine-ftp-pcntl'"

docker-php-ext-install ftp

echo 'Done!'
