
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
> 1. run `ln -sf ../build.sh .` in each sub-folder, and then run `./build.sh` to build docker image by manual.
> 2. [Configure automated builds on Docker Hub](https://docs.docker.com/docker-hub/builds/)


### docker-elk sub-project
```
# git remote add --fetch <remote repo alias> <remote repo url>
git remote add -f docker-elk https://github.com/deviantony/docker-elk.git

# git subtree add --prefix=<sub folder> <remote repo url | remote repo alias> <branch> --squash
git subtree add --prefix=docker-elk docker-elk master --squash

# git subtree pull --prefix=<sub folder> <remote repo url | remote repo alias> <branch> --squash
git subtree pull --prefix=docker-elk docker-elk master --squash

# git subtree push --prefix=<sub folder> <remote repo url | remote repo alias> <branch> --squash
git subtree push --prefix=docker-elk docker-elk master --squash
```

### docker-selenium sub-project
```
git remote add -f docker-selenium https://github.com/SeleniumHQ/docker-selenium.git
git subtree add --prefix=docker-selenium docker-selenium master --squash
git subtree pull --prefix=docker-selenium docker-selenium master --squash
```
add a sub-folder for selenium-node-phantomjs



### Inspiration
[编写Dockerfile的最佳实践](http://cizixs.com/2017/03/28/dockerfile-best-practice)
