#!/bin/sh

set -e

echo "Activating feature 'alpine-gdb'"

apk --no-cache add gdb

echo 'Done!'
