#!/bin/sh

set -e

echo "Activating feature 'alpine-docker'"

apk add --no-cache docker openrc


if [[ $INSTALLDOCKERCOMPOSE == "true" ]]; then
    apk add --no-cache docker-compose
fi

echo 'Done!'