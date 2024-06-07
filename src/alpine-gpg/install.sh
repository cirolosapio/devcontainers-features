#!/bin/sh

set -e

echo "Activating feature 'alpine-gpg'"

apk --no-cache add gpg gpg-agent

echo 'Done!'