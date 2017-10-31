
### Installation
If you're inside the wall, please refer to [Docker的安装包以及周边高速镜像](http://get.daocloud.io/#install-docker)

##### docker 
Run this command to download the latest version of Docker:
```
curl -k -sSl https://get.docker.com | sudo sh
```

##### docker compose
Run this command to download the latest version of Docker Compose:
```
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### Deploy to Dockerhub
##### Base Docker Image Privatization
Images Dependency: scratch -> debian:jessie -> buildpack-deps:jessie-curl -> buildpack-deps:jessie-scm -> buildpack-deps:jessie 

Generate private image to avoid the tricky by the official image updated.
```
FROM buildpack-deps:jessie
MAINTAINER  Acefei <acefeilxy@gmail.com>
```

##### Push image to DockerHub
1. Regiter acount with "user_name" on https://hub.docker.com

2. Login docker hub
```
docker login -t <user_name>
```

3. Build & Push image to docker hub
```
# Always build your image with "user_name" and "tag"
docker build -t <user_name>/<image_name>[:<tag>] .

# After building push the image
docker push <user_name>/<image_name>[:<tag>]
```

> Note:
For convenience, we can run `ln -sf ../build.sh .` in each sub-folder, and then run `./build.sh` to build docker image.

### Inspiration
[编写Dockerfile的最佳实践](http://cizixs.com/2017/03/28/dockerfile-best-practice)
