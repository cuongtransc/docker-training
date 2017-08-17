# Map Container Users to Host Users
docker run -it --rm \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v `pwd`/data:/data \
    -u $( id -u $USER ):$( id -g $USER ) \
    ubuntu:16.04 bash



docker run -it --rm \
    --user-remap "mysuser:root" alpine sh


docker run -it --rm \
    -e USER=cuong \
    -e USERID=1010 \
    -v `pwd`/data:/data \
    ubuntu:16.04 bash



docker run -it --rm wordpress:4.8 bash

docker run -it --rm \
    -v `pwd`/data:/var/www/html/ \
    wordpress:4.8 bash


docker run -it --rm \
    -e MYSQL_ROOT_PASSWORD=mariadb@123 \
    -v `pwd`/mariadb-data:/var/lib/mysql \
    mariadb:10

