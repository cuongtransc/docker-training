# Author: Cuong Tran
#
# Build: docker build -t tranhuucuong91/app:0.1 .
# Run: docker run -d -p 8080:8080 --name app-run tranhuucuong91/app:0.1
#

#--------------------------------------
# Stage: Compile Apps
#--------------------------------------
FROM ubuntu:16.04
MAINTAINER Cuong Tran "tranhuucuong91@gmail.com"

ENV REFRESHED_AT 2017-05-01

RUN apt-get update -qq

# Using apt-cacher-ng proxy for caching deb package
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' > /etc/apt/apt.conf.d/01proxy

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gcc

COPY hello.c /

RUN gcc hello.c -o hello


#--------------------------------------
# Stage: Packaging Apps
#--------------------------------------
FROM bitnami/minideb

COPY --from=0 /hello /hello

CMD ["/hello"]
