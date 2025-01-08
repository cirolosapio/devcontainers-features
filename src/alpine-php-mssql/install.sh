#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mssql'"

apk --no-cache add curl

# Download the desired package(s)
curl -O https://download.microsoft.com/download/7/6/d/76de322a-d860-4894-9945-f0cc5d6a45f8/msodbcsql18_18.4.1.1-1_amd64.apk
curl -O https://download.microsoft.com/download/7/6/d/76de322a-d860-4894-9945-f0cc5d6a45f8/mssql-tools18_18.4.1.1-1_amd64.apk

#Install the package(s)
apk add --allow-untrusted msodbcsql18_18.4.1.1-1_amd.apk
apk add --allow-untrusted mssql-tools18_18.4.1.1-1_amd.apk
# TODO path like this is not updated
PATH="$PATH:/opt/mssql-tools18/bin"

# PHP EXTENSIONS
apk --no-cache add unixodbc-dev
pecl install sqlsrv-5.12.0 pdo_sqlsrv-5.12.0
docker-php-ext-enable sqlsrv pdo_sqlsrv

echo 'Done!'