#!/bin/sh

set -e

echo "Activating feature 'alpine-user'"

adduser -D $USER -u $UID

echo 'Done!'