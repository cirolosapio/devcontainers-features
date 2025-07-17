#!/bin/sh

set -e

echo "Activating feature 'alpine-go'"

apk --no-cache add go

echo 'Done!'
