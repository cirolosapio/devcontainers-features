#!/bin/sh

set -e

echo "Activating feature 'alpine-fswatch'"

apk add --no-cache autoconf alpine-sdk

rm /usr/include/sys/inotify.h

wget https://github.com/emcrisostomo/fswatch/releases/download/1.17.1/fswatch-1.17.1.tar.gz \
  && tar -xzvf fswatch-1.17.1.tar.gz \
  && cd fswatch-1.17.1 \
  && ./configure \
  && make \
  && make install 