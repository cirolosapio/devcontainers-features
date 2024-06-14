#!/bin/sh

set -e

echo "Activating feature 'alpine-php-bcmath'"

apk --no-cache add libldap openldap-dev
docker-php-ext-install ldap

echo 'Done!'
