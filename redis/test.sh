#!/bin/sh
docker run -p 6379:6379 -v /tmp/redis-data:/data --name redis acefei/redis
