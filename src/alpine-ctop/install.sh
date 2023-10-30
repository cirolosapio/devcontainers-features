#!/bin/sh

set -e

echo "Activating feature 'alpine-ctop'"

apk --no-cache add ctop

echo 'Done!'