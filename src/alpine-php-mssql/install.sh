#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mssql'"

apk --no-cache add curl autoconf make g++

# Download the desired package(s)
curl -O https://download.microsoft.com/download/0b3d5518-b4a7-4a2b-afc7-7ee9e967f93c/msodbcsql18_18.6.2.1-1_amd64.apk
curl -O https://download.microsoft.com/download/cad0d30f-b9b1-4765-a011-81d8a66c8b8d/mssql-tools18_18.6.2.1-1_amd64.apk

#Install the package(s)
apk add --allow-untrusted msodbcsql18_18.6.2.1-1_amd64.apk
apk add --allow-untrusted mssql-tools18_18.6.2.1-1_amd64.apk
# TODO path like this is not updated
PATH="$PATH:/opt/mssql-tools18/bin"

# PHP EXTENSIONS
apk --no-cache add unixodbc-dev
pecl install sqlsrv-5.12.0 pdo_sqlsrv-5.12.0
docker-php-ext-enable sqlsrv pdo_sqlsrv

echo 'Done!'