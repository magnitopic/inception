#!/bin/bash

# install Wordpress CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

check_connection() {
  mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -e "SELECT 1;" 2>/dev/null
}

# connect to db
while true; do
  echo "Trying to connect to MYSQL..."
  if check_connection >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

echo "Connection successful."

# use Wordpress CLI to install and configure Wordpress
wp core download --allow-root --path=/wordpress

# create the wp-config.php file with the database information
wp config create --allow-root --path=/wordpress --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST

# install Wordpress
wp core install --allow-root --path=/wordpress --url=localhost --title=alaparicInception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_APDMIN_EMAIL

# create a new author
wp user create --allow-root $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --path=/wordpress

# start php-fpm
/usr/sbin/php-fpm7.4 -F
