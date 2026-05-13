#!/bin/sh

set -e

echo "Activating feature 'alpine-docker-outside-of-docker'"

apk --no-cache add docker

if [ "$_CONTAINER_USER" = "root" ]; then
    ln -sf /var/run/docker-host.sock /var/run/docker.sock
    echo -e '#!/bin/sh\nexec "$@"' > /usr/local/share/docker-init.sh
else
    apk --no-cache add socat

    tee /usr/local/share/docker-init.sh > /dev/null \
<< EOF
#!/bin/sh

set -e

SOCAT_PATH_BASE=/tmp/vscr-docker-from-docker
SOCAT_PID=\${SOCAT_PATH_BASE}.pid
SOURCE_SOCKET=/var/run/docker-host.sock
TARGET_SOCKET=/var/run/docker.sock

if [ ! -f "\$SOCAT_PID" ] || ! kill -0 \$(cat \$SOCAT_PID) 2>/dev/null; then
    # Remove stale socket from previous container lifecycle before re-proxying.
    sudo rm -f "\$TARGET_SOCKET"
    (sudo socat UNIX-LISTEN:\${TARGET_SOCKET},fork,mode=660,user=$_CONTAINER_USER,backlog=128 UNIX-CONNECT:\${SOURCE_SOCKET} 2>&1 & echo \$! | tee \$SOCAT_PID > /dev/null)
fi

set +e
exec "\$@"
EOF

    chown ${_CONTAINER_USER}:root /usr/local/share/docker-init.sh
fi

chmod +x /usr/local/share/docker-init.sh

if [ "$INSTALLDOCKERCOMPOSE" = "true" ]; then
    apk --no-cache add docker-compose
fi

echo 'Done!'