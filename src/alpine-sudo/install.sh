#!/bin/sh

set -e

echo "Activating feature 'alpine-sudo'"

if [ "$_CONTAINER_USER" != "root" ]; then
  apk --no-cache add sudo
  echo "$_CONTAINER_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$_CONTAINER_USER
  chmod 0440 /etc/sudoers.d/$_CONTAINER_USER
fi

echo 'Done!'