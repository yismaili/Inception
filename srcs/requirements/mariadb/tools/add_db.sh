#!/bin/bash

service mysql start
# mysql  -u root  -e "CREATE DATABASE ${DB_NAME}";

# mysql  -u root  -e "CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PSSWRD}'";

# mysql  -u root  -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%';"
# mysql -u root  -e "FLUSH PRIVILEGES;"

 mysql -u root -e "CREATE DATABASE $DB_NAME";
 mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'" ;
 mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%'; FLUSH PRIVILEGES;" ;
 mysql -u root -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" ;
# Create the database
# Create the user
# Grant privileges to the user

# Flush privileges

exec "$@"