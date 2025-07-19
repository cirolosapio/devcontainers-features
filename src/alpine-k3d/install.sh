#!/bin/sh

set -e

echo "Activating feature 'alpine-k3d'"

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo 'Done!'
