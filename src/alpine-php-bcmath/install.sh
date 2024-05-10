#!/bin/sh

set -e

echo "Activating feature 'alpine-php-bcmath'"

docker-php-ext-install bcmath

echo 'Done!'
