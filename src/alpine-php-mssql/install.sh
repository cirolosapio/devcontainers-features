#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mssql'"

apk --no-cache add curl

# Download the desired package(s)
curl -O https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/msodbcsql18_18.3.3.1-1_amd64.apk
curl -O https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/mssql-tools18_18.3.1.1-1_amd64.apk

#Install the package(s)
apk add --allow-untrusted msodbcsql18_18.3.3.1-1_amd64.apk
apk add --allow-untrusted mssql-tools18_18.3.1.1-1_amd64.apk
PATH="$PATH:/opt/mssql-tools18/bin"

# PHP EXTENSIONS
apk --no-cache add unixodbc-dev
pecl install sqlsrv-5.12.0 pdo_sqlsrv-5.12.0
docker-php-ext-enable sqlsrv pdo_sqlsrv

echo 'Done!'