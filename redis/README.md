### Docker 

#### Run `redis-server`

    docker run -d --name redis -p 6379:6379 dockerfile/redis

#### Run `redis-server` with persistent data directory. (creates `dump.rdb`)

    docker run -d -p 6379:6379 -v <data-dir>:/data --name redis dockerfile/redis

#### Run `redis-server` with persistent data directory and password.

    docker run -d -p 6379:6379 -v <data-dir>:/data --name redis dockerfile/redis redis-server /etc/redis/redis.conf --requirepass <password>

#### Run `redis-cli`

    docker run -it --rm --link redis:redis dockerfile/redis bash -c 'redis-cli -h redis'


### Docker Compose
    
    docker-compose up --scale redis=2

Note:
1. when you use scale option:
use
```
ports:
- 6379
```
instead of 
```
ports:
- 6379:6379
```

2. the REDIS_PWD enviroment is defined in $PWD/.env
