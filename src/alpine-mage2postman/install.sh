#!/bin/sh

set -e

echo "Activating feature 'alpine-mage2postman'"

apk --no-cache add zstd libffi icu zlib-ng sqlite-libs

wget -q https://github.com/cirolosapio/mage2postman/releases/download/v0.0.2/mage2postman-alpine -O /usr/local/bin/mage2postman
chmod +x /usr/local/bin/mage2postman

echo 'Done!'