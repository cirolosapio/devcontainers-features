#!/bin/sh

set -e

echo "Activating feature 'alpine-user'"

adduser -D $USER

echo 'Done!'