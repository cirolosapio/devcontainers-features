#!/bin/sh

set -e

echo "Activating feature 'alpine-php-pcntl'"

docker-php-ext-install pcntl

echo 'Done!'
