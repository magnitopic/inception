#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chmod 777 /run/mysqld

service mariadb start

# Create a database and user
echo "start"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME"
mysql -u root -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MARIADB_USERNAME'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'"
mysql -u root -e "FLUSH PRIVILEGES"
echo "end"

service mariadb stop

exec mysqld
