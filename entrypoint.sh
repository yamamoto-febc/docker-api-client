#!/bin/sh

set -eo pipefail

if [ -z "$DOCKER_HOST" ]; then
  echo >&2 '$DOCKER_HOST is not set. Please set $DOCKER_HOST'
  exit 1
else
  DOCKER_URL=`echo $DOCKER_HOST | sed -e s/tcp/https/g`
fi

if [ -z "$1" ]; then
  echo >&2 'Docker API URI is not set. Please set by arg1'
  exit 1
fi

if [ -z "$2" ]; then
  JQ_ARG="."
else
  JQ_ARG="$2"
fi

curl -sSfk --insecure --cert /etc/docker/server.pem --key /etc/docker/server-key.pem "$DOCKER_URL$1" | jq "$JQ_ARG"

