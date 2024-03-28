#!/bin/bash

# Create the user for php-fpm
useradd -r -s /bin/false $WP_ADMIN_USER

# install Wordpress CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# use Wordpress CLI to install and configure Wordpress
wp core download --allow-root

# create the wp-config.php file with the database information
wp config create --allow-root --dbname=$DATABASE_NAME --dbuser=$MARIADB_USERNAME --dbpass=$MARIADB_ROOT_PASSWORD --dbhost=mariadb

# install Wordpress
wp core install --allow-root --url=alaparic.42.fr --title="alaparic" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_APDMIN_EMAIL

# start php-fpm
/usr/sbin/php-fpm7.4 -F
