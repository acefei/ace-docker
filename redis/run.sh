#!/bin/sh

read -p "please set redis password:" pwd
#docker run -d -p 6379:6379 -v /tmp/redis-data:/data acefei/redis redis-server /etc/redis/redis.conf --requirepass $pwd
tee .env <<EOF
REDIS_PWD=$pwd
EOF
# restart docker service to ganrantee the random ports always starting from 32768.
sudo service docker restart
docker-compose up -d --scale redis=2
