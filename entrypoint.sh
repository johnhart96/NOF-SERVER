#!/bin/bash
set -e

echo "Starting service..."

# If the container is a postfix container, start postfix
if [ "$DOCKER_BUILD_POSTFIX" = "YES" ]; then
    service postfix start
fi

# If the container is a dovecot container, start dovecot
if [ "$DOCKER_BUILD_DOVECOT" = "YES" ]; then
    service dovecot start
fi

# Keep the container running
tail -f /dev/null