FROM alpine:3.4

RUN apk add --no-cache nginx
RUN mkdir /run/nginx

COPY index.html /var/lib/nginx/html/index.html

# make utf-8 enabled by default
ENV LANG en_US.utf8

EXPOSE 80 443

VOLUME /var/lib/nginx/html

CMD ["nginx", "-g", "daemon off;"]

