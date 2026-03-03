FROM ubuntu:24.04

# Define the arguments passed from docker-compose
ARG DOCKER_BUILD_POSTFIX
ARG DOCKER_BUILD_DOVECOT
# ... (other ARGs)

# Install common dependencies
RUN apt-get update && apt-get install -y bash curl

# Conditional installation based on ARGs
RUN if [ "$DOCKER_BUILD_POSTFIX" = "YES" ]; then apt-get install -y postfix; fi
RUN if [ "$DOCKER_BUILD_DOVECOT" = "YES" ]; then apt-get install -y dovecot-imapd dovecot-pop3d; fi

# IMPORTANT: You need a script to start the service and keep it running
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]