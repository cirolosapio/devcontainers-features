#!/bin/sh

set -e

echo "Activating feature 'alpine-broot'"

apk --no-cache add broot

echo 'Done!'