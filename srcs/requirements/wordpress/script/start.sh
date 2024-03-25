#!/bin/bash

# install Wordpress CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# use Wordpress CLI to install and configure Wordpress
wp core download --allow-root

wp config create --dbname=$DATABASE_NAME -dbuser=$WP_USER --dbpass=$DATABASE_PASS

wp core install --url=alaparic.42.fr --title="alaparic" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_APDMIN_EMAIL

# start php-fpm
php-fpm7
