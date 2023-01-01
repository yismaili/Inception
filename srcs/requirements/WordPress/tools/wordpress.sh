#!/bin/bash
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
	chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;
if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	touch /var/www/html/wp-config.php;
	sed -i "s/database_name_here/wp_db/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/username_here/yismaili/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/password_here/1234/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/localhost/mariadb/g" "/var/www/html/wp-config-sample.php"
 	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;
	wp core install --allow-root --url=${URL} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PSSWRD} --admin_email=${ADMIN_EMAIL}
	wp user create --allow-root 'yismaili' 'yismaili@42.fr' --user_pass= '1234';
	echo "Wordpress: set up!"
fi
exec "$@"