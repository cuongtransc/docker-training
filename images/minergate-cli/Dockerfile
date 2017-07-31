# Author: Cuong Tran
#
# Build: docker build -t cuongtransc/minergate-cli:0.1 .
# Run: docker run -d cuongtransc/minergate-cli:0.1
#

FROM bitnami/minideb:jessie
MAINTAINER Cuong Tran "cuongtransc@gmail.com"

ENV REFRESHED_AT 2017-06-01

RUN apt-get update -qq

# using apt-cacher-ng proxy for caching deb package
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' > /etc/apt/apt.conf.d/01proxy

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget ca-certificates

RUN wget -q https://download.minergate.com/deb-cli -O deb-cli \
    && dpkg -i deb-cli \
    && rm deb-cli

STOPSIGNAL SIGKILL

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "itctocoi@gmail.com", "-xmr"]
