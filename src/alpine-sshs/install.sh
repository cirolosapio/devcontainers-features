#!/bin/sh

set -e

echo "Activating feature 'alpine-sshs'"

wget https://github.com/quantumsheep/sshs/releases/latest/download/sshs-linux-amd64-musl \
	&& mv sshs-linux-amd64-musl /usr/local/bin/sshs \
	&& chmod +x /usr/local/bin/sshs

echo 'Done!'