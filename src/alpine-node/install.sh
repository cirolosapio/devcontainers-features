#!/bin/sh

set -e

echo "Activating feature 'alpine-node'"

apk --no-cache add nodejs npm

echo 'Done!'