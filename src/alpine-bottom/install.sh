#!/bin/sh

set -e

echo "Activating feature 'alpine-bottom'"

apk --no-cache add bottom --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

echo 'Done!'