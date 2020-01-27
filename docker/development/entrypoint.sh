#!/usr/bin/env sh

set -e

echo "Removing stale pid file if it exists"
rm -f /app/tmp/pids/server.pid

exec "$@"
