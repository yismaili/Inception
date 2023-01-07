#!bin/sh

wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php
# chown -R www-data:www-data /var/www/html/index.php
# chmod 755 /var/www/html/index.php

exec "$@"