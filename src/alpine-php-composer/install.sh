#!/bin/sh

set -e

echo "Activating feature 'alpine-php-composer'"

php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer --version=$VERSION

echo 'Done!'
