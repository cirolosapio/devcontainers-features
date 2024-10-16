#!/bin/sh

set -e

echo "Activating feature 'alpine-bottom'"

apk --no-cache add bottom

echo 'Done!'