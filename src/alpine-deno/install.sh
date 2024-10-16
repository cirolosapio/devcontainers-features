#!/bin/sh

set -e

echo "Activating feature 'alpine-deno'"

apk --no-cache add deno

echo 'Done!'