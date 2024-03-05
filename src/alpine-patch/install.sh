#!/bin/sh

set -e

echo "Activating feature 'alpine-patch'"

apk --no-cache add patch

echo 'Done!'