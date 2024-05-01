#!/bin/sh

set -e

echo "Activating feature 'alpine-sentry-cli'"

curl -sL https://sentry.io/get-cli/ | sh

echo 'Done!'