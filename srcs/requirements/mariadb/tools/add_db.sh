#!/bin/bash
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'" ;
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%'; FLUSH PRIVILEGES;" ;
mysql -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" ;
kill `cat /var/run/mysqld/mysqld.pid`
mysqld