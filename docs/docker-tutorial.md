<!-- TOC -->

- [Docker install](#docker-install)
    - [Install docker-engine](#install-docker-engine)
    - [Install docker-compose](#install-docker-compose)
- [Docker trick](#docker-trick)
- [docker stress test](#docker-stress-test)
- [Alpine](#alpine)
- [Docker limit](#docker-limit)
- [Trick](#trick)
    - [Save all the images on docker-compose.yml and deploy on machine not connected to the internet](#save-all-the-images-on-docker-composeyml-and-deploy-on-machine-not-connected-to-the-internet)
- [LAMP Stack](#lamp-stack)
- [Docker Firewall](#docker-firewall)
- [ufw allow Private LAN](#ufw-allow-private-lan)
- [Check logs](#check-logs)
- [Selenium](#selenium)
- [Docker Basic](#docker-basic)
- [Hand-on Lab](#hand-on-lab)
- [Docker Logging](#docker-logging)
- [Docker Visualization](#docker-visualization)

<!-- /TOC -->

# Docker install

**Nếu sử dụng apt-cacher-ng proxy thì cần cấu hình để pass qua https**

```sh
sudo vi /etc/apt-cacher-ng/acng.conf

PassThroughPattern: (get\.docker\.com|apt\.dockerproject\.org):443$

sudo service apt-cacher-ng restart
```


**Using docker0 default**

```sh
echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' | sudo tee /etc/apt/apt.conf.d/01proxy

echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' | tee /etc/apt/apt.conf.d/01proxy
```


## Install docker-engine
https://docs.docker.com/installation/ubuntulinux/

```sh
wget -qO- https://get.docker.com/ | sh
sudo usermod -a -G docker `whoami`
```


```sh
sudo apt-get install -y apt-transport-https

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update

# Verify that apt is pulling from the right repository.
apt-cache policy docker-engine

# install docker-engine
sudo apt-get install docker-engine
```

## Install docker-compose
```sh
COMPOSE_VERSION=1.8.0
sudo wget https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```


# Docker trick
```sh
#--- Docker stats ---
# stats all service in docker compose directory
docker stats `docker-compose ps | tail -n+3|awk '{print $1}'`

# stats all docker container are running
docker stats `docker ps | awk '{print $NF}' | tail -n+2`

#--- Docker remove ---
# remove all stopped containers
docker ps -a | awk '/Exit/ {print $1}' | xargs -r docker rm

# remove all untagged images
docker images | awk '/^<none>/ {print $3}' | xargs -r docker rmi


# remove old version images
docker images | grep registry.olbius.lan:5001/cuongtransc/olbius-pos | tail -n +4 | awk '{print $3}' | xargs -r docker rmi
```

<= sẽ có lỗi khi remove image_id được gắn nhiều tag
-> nên tìm cách xóa bằng image_name:tag

-> thêm -f là xong (force)

```
docker images | grep ro.lan:5001/cuongtransc/mail | tail -n +4 | awk '{print $3}' | xargs -r docker rmi -f
```




# docker stress test
https://goldmann.pl/blog/2014/09/11/resource-management-in-docker/

```sh
docker run -it --rm --name test stress --cpu 4
```



# Alpine
The apk tool has the following applets:

- `add`     Add new packages to the running system
- `del`     Delete packages from the running system
- `fix`     Attempt to repair or upgrade an installed package
- `update`  Update the index of available packages
- `info`    Prints information about installed or available packages
- `search`  Search for packages or descriptions with wildcard patterns
- `upgrade` Upgrade the currently installed packages
- `cache`   Maintenance operations for locally cached package repository
- `version` Compare version differences between installed and available packages
- `index`   create a repository index from a list of packages
- `fetch`   download (but not install) packages
- `audit`   List changes to the file system from pristine package install state
- `verify`  Verify a package signature



```
apk update
```

Packages:

```
nginx
curl

```



http://blog.zot24.com/tips-tricks-with-alpine-docker/

1. Install and remove cache afterwards

```
RUN apk --no-cache add curl
```

2. Group dependencies (easy clean)
If installing like:

```
RUN apk add --virtual .build-dependencies curl make
```

Will allow us to remove all dependencies with just one command

```
RUN apk del .build-dependencies
```


3. Manage users and groups
You could use `shadow` tool suite, atm it's on the testing repository so we'll need first to:

```
echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

apk --no-cache add shadow
```

```bash
delgroup ping           # remove group ping
addgroup -g 999 docker  # create group docker with gid 999
addgroup jenkins docker # add user jenkins to group docker
groups jenkins          # groups for user jenkins
id -Gn docker           # info about the users groups
getent group docker     # info about the group docker
```


4. If C libraries needed as glibc
I'll recommed you use instead of alpine base image directly this other image `frol/docker-alpine-glibc` that will install for us an unofficial glib library that will solve of problem.


Install a specific version of a package that it's not on the default repo

```
apk add 'postgresql>9.5' --update-cache --repository http://nl.alpinelinux.org/alpine/edge/main \
```





# Docker limit

Gioi han cpu cua process

```bash
docker run -it --rm --name test1 --cpuset-cpus 0-3 ubuntu:14.04 bash
```

echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' | tee /etc/apt/apt.conf.d/01proxy

apt-get update
apt-get install -y stress


stress -c 1


cpu quota


docker run -it --rm --cpuset-cpus 0-3 cuongtransc/stress:0.1 stress -c `nproc`





Simple docker stress test and monitoring tools

https://github.com/spotify/docker-stress




# Trick

## Save all the images on docker-compose.yml and deploy on machine not connected to the internet

```sh
# Save Compressed Images
IMAGES=`grep '^\s*image' docker-compose.yml | sed 's/image://' | sort | uniq`

docker save $IMAGES | gzip > images.tar.gz

# Load Compressed Images
gunzip -c images.tar.gz | docker load
```



# LAMP Stack


```
docker run -d -p 8080:80 -v `pwd`/html/:/var/www/html php:7.1-apache

```




# Docker Firewall

n01	188.166.186.249	10.130.20.211
n02	188.166.214.96	10.130.54.91
n03	139.59.98.131	10.130.54.105


docker pull nginx:alpine


docker run --rm -p 80:80 nginx:alpine


docker run --rm -p 10.130.20.211:80:80 nginx:alpine


iptables -N LOG
iptables -A INPUT -j LOG
iptables -A LOG -m limit --limit 60/min -j LOG --log-prefix "Iptables DROP: " --log-level 7



# ufw allow Private LAN

```bash

sudo ufw allow from 10.130.20.211
sudo ufw allow from 10.130.54.91
sudo ufw allow from 10.130.54.105
```

docker publish
-> by pass ufw



Test requests

apt-get install apache2-utils

ab -n 1000000 -c 1000 http://188.166.186.249/

ab -n 1000000 -c 1000  http://139.59.98.131/

# Check logs

sudo tail -f /var/log/syslog

sudo tail -f /var/log/ufw.log









# Selenium

//*[@id="page_contents"]/div[2]/div[5]/form/span/button



docker run -d -p 4444:4444 selenium/standalone-firefox:3.3.0


docker run -d -p 4444:4444 selenium/standalone-chrome:3.3.0



# Docker Basic



Tovin Nguyen
"Docker images" thì nên nói luôn "Docker containers" đi, để còn đỡ lẫn docker run với docker start


Hieu Le
nên so sánh với các cái khác tương đồng và mang tính defacto hơn như runc hay oci nhé
Docker dạo này bắt đầu bị mang tiếng xấu nên cần cung cấp cái view đủ hơn cho người đọc. Ví dụ về container image layer cần chỉ ra tính incremental và incremental của docker khác lxc, lxd hay runc thế nào để chúng nó vẫn chơi được với nhau.
Cái này là request của anh nhé, vì anh cũng chưa nắm rõ.

nhiều, ví dụ việc tích hợp với systemd nhưng ko theo đúng concept của systemd, rồi việc lơ oci ban đầu, mãi sau mới thèm nói chuyện. Chủ yếu là do thái độ của Docker với cộng đồng nên bị ghét thôi.
Đọc link sau: https://medium.com/@adriaandejonge/moving-from-docker-to-rkt-310dc9aec938





Source: https://hackmd.io/p/BkZ_6xxc#/4

What is docker
Software containerization platform
Feature
LightWeight (Without hypervisor, use hardware resource directly)
Based on open standards

-> Virtual Machines vs Containers
-> Matrix Dependency Hell

Dockerfile
Docker Operation



What is docker-compose
A tool for defining and running multi-container Docker applications
Compose can manage your application:
Start, stop and rebuild services
View the status of running services

Adv
Multiple isolated environments on a single host
Preserve volume data
Recreate containers that have changed
Specifying custom networks


Define a set of services using docker-compose.yml
version: '2'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
    environment:
      MY_ENV: development
      MY_ACCOUNT: admin
      MY_PASSWORD: admin
    links:
      - redis
  redis:

Install Laravel 5.2 Environment
Outline
Install Docker
Install docker-compose
Install Laravel environment
Configurate
What is Docker
What is docker-compose
Dockerfile














FROM nginx:latest

MAINTAINER Mahmoud Zalt <mahmoud@zalt.me>

ADD nginx.conf /etc/nginx/
ADD laravel.conf /etc/nginx/sites-available/
ADD phpmyadmin.conf /etc/nginx/sites-available/

RUN echo "upstream php-upstream { server php-fpm:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80 443
Docker operation

Image from here
Adv
Multiple isolated environments on a single host
Preserve volume data
Recreate containers that have changed
Specifying custom networks
Define a set of services using docker-compose.yml
version: '2'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
    environment:
      MY_ENV: development
      MY_ACCOUNT: admin
      MY_PASSWORD: admin
    links:
      - redis
  redis:
    image: redis
The file can be translate to the commands below:







docker build -t dirName_web .
docker run -d --name dirName_redis_1 redis
docker run -d --name dirName_web_1
 	-p 5000:5000 -v .:/code
 	-e MY_ENV=development
 	-e MY_ACCOUNT=admin
 	-e MY_PASSWORD=admin
 	--links redis dirName_web


Command List
Create / start / stop containers
$ docker-compose up -d
Pulling image redis...
Building web...
Starting composetest_redis_1...
Starting composetest_web_1...


$ docker-compose ps
Name Command State Ports
-------------------------------------------------------------------
composetest_redis_1 /usr/local/bin/run Up
composetest_web_1 /bin/sh -c python app.py Up 5000->5000/tcp
$ docker-compose stop
Stoping composetest_redis_1...
Stoping composetest_web_1...


How do I learn Laravel 5.2
Basic
Routing
Controller
Request & Response
Query Builder
ORM
Middleware
Views
Blade Template



# Hand-on Lab
http://npalm.github.io/docker-introduction/#/9/1





# Docker Logging

https://dzone.com/articles/what-are-docker-logs-examples-tutorials-amp-more




# Docker Visualization

```bash
docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock manomarks/visualizer

http://127.0.0.1:8080

docker swarm init


docker run -it --rm -p 80:80 cuongtransc/nginx:1.10.3
```



```bash
# Create service
docker service create --name collab alpine ping google.com

docker service tasks collab

docker service scale collab=5
```


