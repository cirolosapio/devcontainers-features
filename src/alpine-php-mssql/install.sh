#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mssql'"

apk --no-cache add curl autoconf make g++

# Download the desired package(s)
curl -O https://download.microsoft.com/download/ade174b7-8cea-4543-91a6-c33ae320c2f0/msodbcsql18_18.7.1.1-1_amd64.apk
curl -O https://download.microsoft.com/download/a5dcc5e7-6124-49d3-8df4-48d738a0e784/mssql-tools18_18.7.1.1-1_amd64.apk

#Install the package(s)
apk add --allow-untrusted msodbcsql18_18.7.1.1-1_amd64.apk
apk add --allow-untrusted mssql-tools18_18.7.1.1-1_amd64.apk
# TODO path like this is not updated
PATH="$PATH:/opt/mssql-tools18/bin"

# PHP EXTENSIONS
apk --no-cache add unixodbc-dev
pecl install sqlsrv-5.13.3 pdo_sqlsrv-5.13.3
docker-php-ext-enable sqlsrv pdo_sqlsrv

echo 'Done!'