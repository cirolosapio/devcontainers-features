#!/bin/sh

set -e

echo "Activating feature 'alpine-docker-outside-of-docker'"

# If init file already exists, exit
if [ -f "/usr/local/share/docker-init.sh" ]; then
    exit 0
fi

apk --no-cache add docker

if [[ -z $_CONTAINER_USER ]]; then
    ln -s /var/run/docker-host.sock /var/run/docker.sock
    echo -e '#!/bin/sh\nexec "$@"' > /usr/local/share/docker-init.sh
else
    apk --no-cache add socat sudo
    echo "$_CONTAINER_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$_CONTAINER_USER
    chmod 0440 /etc/sudoers.d/$_CONTAINER_USER

    tee /usr/local/share/docker-init.sh > /dev/null \
<< EOF
#!/bin/sh

set -e

SOCAT_PATH_BASE=/tmp/vscr-docker-from-docker
SOCAT_PID=\${SOCAT_PATH_BASE}.pid

if [ ! -f "\$SOCAT_PID" ] || ! kill -0 \$(cat \$SOCAT_PID) 2>/dev/null; then
    (sudo socat UNIX-LISTEN:/var/run/docker.sock,fork,mode=660,user=$_CONTAINER_USER,backlog=128 UNIX-CONNECT:/var/run/docker-host.sock 2>&1 & echo \$! | tee \$SOCAT_PID > /dev/null)
fi

set +e
exec "\$@"
EOF

    chown ${_CONTAINER_USER}:root /usr/local/share/docker-init.sh
fi

chmod +x /usr/local/share/docker-init.sh

if [[ $INSTALLDOCKERCOMPOSE == "true" ]]; then
    apk --no-cache add docker-compose
fi

if command -v zsh &> /dev/null; then
    apk --no-cache add docker-zsh-completion
fi

echo 'Done!'