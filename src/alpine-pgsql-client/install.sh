#!/bin/sh

set -e

echo "Activating feature 'alpine-pgsql-client'"

apk --no-cache add postgresql$VERSION-client

echo 'Done!'