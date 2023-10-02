#!/bin/sh

set -e

echo "Activating feature 'alpine-bat'"

apk --no-cache add bat

echo "alias cat='bat'" >> $_CONTAINER_USER_HOME/.profile

echo 'Done!'