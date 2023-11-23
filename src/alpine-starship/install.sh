#!/bin/sh

set -e

echo "Activating feature 'alpine-starship'"

apk --no-cache add starship

echo 'Done!'