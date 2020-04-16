FROM wordpress:5.3
LABEL maintainer="cuongtransc@gmail.com"

COPY upload.ini /usr/local/etc/php/conf.d/uploads.ini

# Docker Entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
