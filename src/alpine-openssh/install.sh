#!/bin/sh

set -e

echo "Activating feature 'alpine-openssh'"

apk --no-cache add openssh

echo 'Done!'