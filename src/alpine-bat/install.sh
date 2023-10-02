#!/bin/sh

set -e

echo "Activating feature 'alpine-bat'"

apk --no-cache add bat

su $_CONTAINER_USER

echo "alias cat='bat'" >> ~/.profile

echo 'Done!'