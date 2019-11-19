FROM wordpress:5.3
LABEL maintainer="cuongtransc@gmail.com"

# Docker Entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
