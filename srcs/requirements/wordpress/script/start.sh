#!/bin/bash

echo "$DB_ADMIN"

# Create the user for php-fpm
useradd -r -s /bin/false $WP_ADMIN_USER

# install Wordpress CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# check contetion to database
while ! timeout 1 bash -c 'cat < /dev/null > /dev/tcp/mariadb/3306'; do
    echo "Waiting for MariaDB to be up and running... 🕐"
    sleep 1
done
echo "Successfully connected to MariaDB ✅"

# use Wordpress CLI to install and configure Wordpress
wp core download --allow-root --path=/wordpress

# create the wp-config.php file with the database information
wp config create --allow-root --path=/wordpress --dbname=$DATABASE_NAME --dbuser=$DB_ADMIN --dbpass=$DB_ADMIN_PASS --dbhost=mariadb

# install Wordpress
wp core install --allow-root --path=/wordpress --url=localhost --title=alaparicInception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_APDMIN_EMAIL

# create a new author
wp user create --allow-root $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --path=/wordpress

# start php-fpm
/usr/sbin/php-fpm7.4 -F
