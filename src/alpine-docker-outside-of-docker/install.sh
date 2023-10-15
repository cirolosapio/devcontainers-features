#!/bin/sh

set -e

echo "Activating feature 'alpine-docker'"

apk add --no-cache docker

CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
echo "CURRENT_USER is $CURRENT_USER"

if [[ -z $CURRENT_USER ]]; then
    echo "CURRENT_USER is empty, using 'root'"
else
    echo "HOST_DOCKER_GID is $HOSTDOCKERGID"

    HOST_DOCKER_GROUP=$(getent group $HOSTDOCKERGID | cut -d: -f1)

    if [[ -z $HOST_DOCKER_GROUP ]]; then
        echo "HOST_DOCKER_GROUP is empty, creating new group 'host-docker'"
        addgroup -g $HOSTDOCKERGID host-docker
        HOST_DOCKER_GROUP=host-docker
    else
        echo "HOST_DOCKER_GROUP is already used, using existing group '$HOST_DOCKER_GROUP'"
    fi

    addgroup $CURRENT_USER $HOST_DOCKER_GROUP
fi

if [[ $INSTALLDOCKERCOMPOSE == "true" ]]; then
    apk add --no-cache docker-compose
fi

if [[ $INITZSH == "true" ]]; then
    apk --no-cache add docker-zsh-completion
fi

echo 'Done!'