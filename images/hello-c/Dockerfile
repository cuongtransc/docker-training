# Author: Cuong Tran
#
# Build: docker build -t test/hello-c:0.1 .
# Run: docker run --rm test/hello-c:0.1
#

#--------------------------------------
# Stage 1: Compile Apps
#--------------------------------------
FROM bitnami/minideb:jessie
MAINTAINER Cuong Tran "cuongtransc@gmail.com"

ENV REFRESHED_AT 2017-05-01

RUN apt-get update -qq

# Using apt-cacher-ng proxy for caching deb package
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' > /etc/apt/apt.conf.d/01proxy

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gcc

COPY hello.c /

RUN gcc hello.c -o hello


#--------------------------------------
# Stage 2: Packaging Apps
#--------------------------------------
FROM bitnami/minideb:jessie

COPY --from=0 /hello /hello

CMD ["/hello"]
