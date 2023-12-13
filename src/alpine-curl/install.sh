#!/bin/sh

set -e

echo "Activating feature 'alpine-curl'"

apk --no-cache add curl

echo 'Done!'