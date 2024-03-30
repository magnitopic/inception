#!/bin/bash

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

# Start MariaDB
mysql_install_db >/dev/null 2>&1

# Configure MariaDB, create a database and user
echo "-- start of database config file --"
rm -f /init.sql
echo "USE mysql;" >> /init.sql
echo "FLUSH PRIVILEGES;" >> /init.sql
echo "ALTER USER 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASS';" >> /init.sql
echo "CREATE USER IF NOT EXISTS '$DB_ADMIN' IDENTIFIED BY '$DB_ADMIN_PASS';" >> /init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER' IDENTIFIED BY '$DB_USER_PASS';" >> /init.sql
echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" >> /init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN'@'%';" >> /init.sql
echo "GRANT SELECT, INSERT, UPDATE, DELETE ON $DATABASE_NAME.* TO '$DB_ADMIN_PASS'@'%';" >> /init.sql
echo "FLUSH PRIVILEGES;" >> /init.sql
echo "-- end of database config file --"

echo "-- Database config file --"
cat /init.sql
echo "-- End of database config file --"

echo "-- Starting database --"
mysqld_safe --init-file=/init.sql
