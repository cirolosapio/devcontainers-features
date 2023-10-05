#!/bin/sh

set -e

echo "Activating feature 'alpine-git'"

apk --no-cache add git

echo 'Done!'