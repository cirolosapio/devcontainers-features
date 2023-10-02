#!/bin/sh

set -e

echo "Activating feature 'alpine-starship'"

apk --no-cache add starship --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

echo 'Done!'