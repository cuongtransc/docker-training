# Author: Cuong Tran
#
# Build: docker build -t test/nginx:1.10
# Run: docker run -d -p 80:80 --name test-nginx test/nginx:1.10
#

FROM alpine:3.4
MAINTAINER Cuong Tran "cuongtransc@gmail.com"

ENV NGINX_VERSION 1.10.1-r1

RUN apk add --no-cache nginx=${NGINX_VERSION}

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx.vh.default.conf /etc/nginx/conf.d/default.conf

RUN mkdir /var/www/html
COPY index.html /var/www/html/index.html

VOLUME /var/www/html
WORKDIR /var/www/html

# make utf-8 enabled by default
ENV LANG en_US.utf8

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
# RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
