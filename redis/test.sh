#!/bin/sh

docker run -d -p 6379:6379 -v /tmp/redis-data:/data acefei/redis redis-server /etc/redis/redis.conf --requirepass $1
