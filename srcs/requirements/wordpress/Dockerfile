FROM debian:bullseye

RUN apt update && apt -y install wget \
								 curl \
								 bash \
								 php \
								 php-fpm \
								 php-mysqli \
								 php-mbstring \
								 mariadb-client

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create the php directory to enable php-fpm to run
RUN mkdir -p /var/www/html

# Copy the script and launch it
COPY ./script/start.sh /tmp/start.sh

#Go to the html directory
WORKDIR /var/www/html

#Launch php-fpm
CMD ["/bin/bash", "/tmp/start.sh"]
