#!/bin/sh

set -e

echo "Activating feature 'alpine-aws-cli'"

apk --no-cache add aws-cli

echo 'Done!'