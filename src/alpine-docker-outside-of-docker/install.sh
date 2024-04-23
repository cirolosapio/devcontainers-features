#!/bin/sh

set -e

echo "Activating feature 'alpine-docker-outside-of-docker'"

apk add --no-cache docker

CURRENT_USER=$(getent passwd 1000 | cut -d: -f1)

if [[ -z $CURRENT_USER ]]; then
    ln -s /var/run/docker-host.sock /var/run/docker.sock
    echo -e '#!/bin/sh\nexec "$@"' > /usr/local/share/docker-init.sh
else
    apk add --no-cache socat sudo
    echo "$CURRENT_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$CURRENT_USER
    chmod 0440 /etc/sudoers.d/$CURRENT_USER

    tee /usr/local/share/docker-init.sh > /dev/null \
<< EOF
#!/bin/sh
#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

set -e

SOCAT_PATH_BASE=/tmp/vscr-docker-from-docker
SOCAT_PID=\${SOCAT_PATH_BASE}.pid

if [ ! -f "\${SOCAT_PID}" ] || ! ps -p \$(cat \${SOCAT_PID}) > /dev/null; then
    rm -rf /var/run/docker.sock
    sudo socat UNIX-LISTEN:/var/run/docker.sock,fork,mode=660,user=$CURRENT_USER,backlog=128 UNIX-CONNECT:/var/run/docker-host.sock 2>&1
fi

# Execute whatever commands were passed in (if any). This allows us
# to set this script to ENTRYPOINT while still executing the default CMD.
set +e
exec "\$@"
EOF

    chown ${CURRENT_USER}:root /usr/local/share/docker-init.sh
fi

chmod +x /usr/local/share/docker-init.sh

if [[ $INSTALLDOCKERCOMPOSE == "true" ]]; then
    apk add --no-cache docker-compose
fi

if command -v zsh &> /dev/null; then
    apk --no-cache add docker-zsh-completion
fi

echo 'Done!'