### Warm Up
[Docker的安装包以及周边高速镜像](http://get.daocloud.io/#install-docker)
[编写Dockerfile的最佳实践](http://cizixs.com/2017/03/28/dockerfile-best-practice)

### Base Docker Image Privatization
Images Dependency: scratch -> debian:jessie -> buildpack-deps:jessie-curl -> buildpack-deps:jessie-scm -> buildpack-deps:jessie 

Generate private image to avoid the tricky by the official image updated.
```
FROM buildpack-deps:jessie
MAINTAINER  Acefei <acefeilxy@gmail.com>
```

### Push image to DockerHub
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
