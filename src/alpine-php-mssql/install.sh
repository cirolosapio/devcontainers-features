#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mssql'"

apk --no-cache add curl

# Download the desired package(s)
curl -O https://download.microsoft.com/download/9dcab408-e0d4-4571-a81a-5a0951e3445f/msodbcsql18_18.6.1.1-1_amd64.apk
curl -O https://download.microsoft.com/download/b60bb8b6-d398-4819-9950-2e30cf725fb0/mssql-tools18_18.6.1.1-1_amd64.apk

#Install the package(s)
apk add --allow-untrusted msodbcsql18_18.4.1.1-1_amd64.apk
apk add --allow-untrusted mssql-tools18_18.4.1.1-1_amd64.apk
# TODO path like this is not updated
PATH="$PATH:/opt/mssql-tools18/bin"

# PHP EXTENSIONS
apk --no-cache add unixodbc-dev
pecl install sqlsrv-5.12.0 pdo_sqlsrv-5.12.0
docker-php-ext-enable sqlsrv pdo_sqlsrv

echo 'Done!'