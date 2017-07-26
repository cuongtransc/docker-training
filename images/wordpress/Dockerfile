# Author: Cuong Tran
#
# Build: docker build -t cuongtransc/wordpress:4.8
# Run: docker run -d -p 80:80 --name app-run cuongtransc/wordpress:4.8
#

FROM wordpress:4.8
MAINTAINER Cuong Tran "cuongtransc@gmail.com"

# EXPOSE 8

# Docker Entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
