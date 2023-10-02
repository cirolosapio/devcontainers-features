#!/bin/sh

set -e

echo "Activating feature 'alpine-bat'"

apk --no-cache add bat

CURRENT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
echo "Acting as $CURRENT_USER"
su $CURRENT_USER

echo "alias cat='bat'" >> ~/.profile

echo 'Done!'