#!/bin/sh

set -e

echo "Activating feature 'alpine-phpstorm-libs'"

apk add --no-cache gcompat libxi libxrender libxtst

echo 'Done!'