#!/bin/sh

set -e

echo "Activating feature 'alpine-phpstorm-libs'"

apk --no-cache add curl unzip libxext libxrender libxtst libxi freetype procps gcompat

echo 'Done!'