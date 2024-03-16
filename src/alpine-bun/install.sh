#!/bin/sh

set -e

echo "Activating feature 'alpine-bun'"

apk --no-cache add curl

curl -fsSL https://bun.sh/install | bash

echo 'Done!'