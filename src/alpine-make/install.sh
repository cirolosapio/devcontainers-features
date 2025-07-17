#!/bin/sh

set -e

echo "Activating feature 'alpine-make'"

apk --no-cache add make

echo 'Done!'
