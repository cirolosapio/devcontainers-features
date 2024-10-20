#!/bin/sh

set -e

echo "Activating feature 'alpine-d2'"

apk --no-cache add make curl ncurses

VERSION=v0.6.7
OS=linux
ARCH=amd64

curl -fsSLO "https://github.com/terrastruct/d2/releases/download/$VERSION/d2-$VERSION-$OS-$ARCH.tar.gz"
tar -xzf "d2-$VERSION-$OS-$ARCH.tar.gz"
make -sC "d2-$VERSION" install

echo 'Done!'
