# Dockerize: build from source

```Dockerfile
FROM alpine:3.4

RUN step 1: install develop packages
    && step 2: compile
    && step 3: uninstall develop packages


CMD ["nginx", "-g", "daemon off;"]
```


# Dockerize nginx

**apk install package with version**

```sh
NGINX_VERSION 1.10.1-r1
apk add --no-cache nginx=${NGINX_VERSION}
```


## Create Docker Image by commit

```
# step 1: run docker container
docker run -it alpine:3.4 sh

# step 2: install nginx
apk add --no-cache nginx

# step 3: create docker image by commit
docker commit f2d8ae0825d1 test/hello
```


## Create Docker Image from Dockerfile
```
docker build -t test/nginx:v1 .

docker run -it -p 80:80 test/nginx:v1
```
