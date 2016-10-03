# docker-training
Docker Training


## Install Docker and Docker Compose
**Install Docker**

```sh
wget -qO- https://get.docker.com/ | sh
sudo usermod -a -G docker `whoami`
```

After add user to `docker` group, please logout and then login to take effect.

**Install docker-compose**

```sh
COMPOSE_VERSION=1.8.1
sudo wget https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```


## Dockerfile and Dockerize

1. Dockerfile: http://bit.ly/c-dockerfile
2. Dockerize Best Practices: http://bit.ly/c-dockerize-best-practices
3. Docker Image Template: http://bit.ly/c-docker-image-template

