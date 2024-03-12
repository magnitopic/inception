FROM debian:bullseye

RUN apt update && apt install -y php-fpm

COPY ./srcs/requirements/wordpress/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Create the php directory to enable php-fpm to run
RUN mkdir -p /var/www/html

# Copy the script and launch it
COPY ./srcs/requirements/wordpress/start.sh /tmp/start.sh

#Go to the html directory
WORKDIR /var/www/html

#Launch php-fpm
CMD ["/bin/bash", "/tmp/start.sh"]
