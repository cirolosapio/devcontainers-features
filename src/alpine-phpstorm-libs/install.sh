#!/bin/sh

set -e

echo "Activating feature 'alpine-phpstorm-libs'"

apk --no-cache add gcompat libxi libxrender libxtst

echo 'Done!'