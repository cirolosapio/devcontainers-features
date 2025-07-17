#!/bin/sh

set -e

echo "Activating feature 'alpine-opentofu'"

apk --no-cache add opentofu

echo 'Done!'
