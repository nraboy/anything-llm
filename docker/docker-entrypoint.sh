#!/bin/bash

if [ ! -z "${UID}" ]; then
  if [ ! "$(id -u anythingllm)" -eq "${UID}" ]; then
    usermod -o -u "${UID}" anythingllm
  fi
fi

if [ ! -z "${GID}" ]; then
  if [ ! "$(id -g anythingllm)" -eq "${GID}" ]; then
    groupmod -g "${GID}" anythingllm
  fi
fi

chown -R anythingllm:anythingllm /app
chown -R anythingllm:anythingllm /app/server
chown -R anythingllm:anythingllm /app/frontend
chown -R anythingllm:anythingllm /app/collector
chown -R anythingllm:anythingllm "${STORAGE_DIR}"

exec gosu anythingllm "/usr/local/bin/docker-entrypoint-final.sh"