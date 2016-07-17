# docker-training
Docker Training


## Install Docker and Docker Compose
**Install Docker**

```sh
wget -qO- https://get.docker.com/ | sh
sudo usermod -a -G docker `whoami`
```

**Install docker-compose**

```sh
COMPOSE_VERSION=1.7.1
sudo wget https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```