#!/bin/sh

set -e

echo "Activating feature 'alpine-php-magento'"

apk --no-cache add patch icu-dev icu-data-full libpng-dev libjpeg-turbo-dev libxslt-dev libxml2-dev freetype-dev
docker-php-ext-configure gd --with-freetype --with-jpeg
# docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/
docker-php-ext-install bcmath gd intl soap xsl sockets

echo 'Done!'