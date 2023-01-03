#!/bin/bash
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	touch /var/www/html/wp-config.php;
	sed -i "s/database_name_here/${DB_NAME}/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/username_here/${DB_USER}/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/password_here/${DB_PSSWRD}/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/localhost/${DB_HOST}/g" "/var/www/html/wp-config-sample.php"
 	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;
	wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PSSWRD --admin_email=$ADMIN_EMAIL
	wp user create --allow-root ${DB_NAME} ${USER_EMAIL} --user_pass= /${DB_PSSWRD};
	echo "Wordpress: set up!"
fi
exec "$@"