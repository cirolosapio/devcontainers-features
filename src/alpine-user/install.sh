#!/bin/sh

set -e

echo "Activating feature 'alpine-user'"

adduser -D $USER -u $UID

for dir in $USERFOLDERS; do
  if [ -d "$dir" ]; then
    chown -R "$USER:$USER" "$dir"
  fi
done

echo 'Done!'