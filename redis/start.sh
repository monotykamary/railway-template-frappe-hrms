#!/bin/sh
set -eu
mkdir -p /var/lib/redis/data
chown -R redis:redis /var/lib/redis
exec gosu redis redis-server --dir /var/lib/redis/data --appendonly yes --maxmemory-policy allkeys-lru
