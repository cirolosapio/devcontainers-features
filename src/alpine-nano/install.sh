#!/bin/sh

set -e

echo "Activating feature 'alpine-nano'"

apk --no-cache add nano

echo 'Done!'