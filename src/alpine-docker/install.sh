#!/bin/sh

set -e

echo "Activating feature 'alpine-docker'"

# apk add --no-cache docker openrc

addgroup username docker

if [[ $INSTALLDOCKERCOMPOSE == "true" ]]; then
    apk add --no-cache docker-compose
fi

echo 'Done!'