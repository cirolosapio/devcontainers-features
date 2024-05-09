#!/bin/sh

set -e

echo "Activating feature 'alpine-jq'"

apk --no-cache add jq

echo 'Done!'