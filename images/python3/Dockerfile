# Author: Cuong Tran
#
# Build: docker build -t cuongtransc/python3:3.5 .
#

FROM ubuntu:16.04
MAINTAINER Cuong Tran "cuongtransc@gmail.com"

# Using apt-cacher-ng proxy for caching deb package
#RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' > /etc/apt/apt.conf.d/01proxy

ENV REFRESHED_AT 2017-04-13

RUN apt-get update -qq

# Make the "en_US.UTF-8" locale
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip build-essential python3-dev

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

WORKDIR /data

CMD ["python3"]
