#!/bin/sh

set -e

echo "Activating feature 'alpine-helm'"

apk --no-cache add helm

echo 'Done!'
