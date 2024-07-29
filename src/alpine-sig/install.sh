#!/bin/sh

set -e

echo "Activating feature 'alpine-sig'"

wget https://github.com/ynqa/sig/releases/latest/download/sigrs-x86_64-unknown-linux-musl.tar.xz \
	&& tar -xf sigrs-x86_64-unknown-linux-musl.tar.xz \
	&& mv sigrs-x86_64-unknown-linux-musl/sig /usr/local/bin/sig

echo 'Done!'