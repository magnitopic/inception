#!/bin/bash

# Create a database and user
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wp_general"
mysql -u root -e "GRANT ALL PRIVILEGES ON mydb.* TO '$MARIADB_USERNAME'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'"
mysql -u root -e "FLUSH PRIVILEGES"

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

exec mysqld
