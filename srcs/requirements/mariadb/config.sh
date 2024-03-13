#!/bin/bash
service mysql start
mysql -u root -e ""
mysql -u root -e "GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'localhost' IDENTIFIED BY 'mypassword'"