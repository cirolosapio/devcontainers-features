#!/bin/sh

set -e

echo "Activating feature 'alpine-gh-cli'"

# apk --no-cache add github-cli --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
apk --no-cache add github-cli

echo 'Done!'