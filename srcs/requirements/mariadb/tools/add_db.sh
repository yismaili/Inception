#!/bin/bash
service mysql start
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'" ;
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%'; FLUSH PRIVILEGES;" ;
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" ;
cd  /var/run/mysqld/
kill `cat mysqld.pid`
 exec "$@"
