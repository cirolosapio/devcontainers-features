#!/bin/sh

set -e

echo "Activating feature 'alpine-bash'"

apk --no-cache add bash

sed -i "s|:/bin/ash|:/bin/bash|g" /etc/passwd

echo 'Done!'