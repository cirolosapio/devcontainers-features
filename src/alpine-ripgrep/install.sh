#!/bin/sh

set -e

echo "Activating feature 'alpine-ripgrep'"

apk --no-cache add ripgrep

echo 'Done!'