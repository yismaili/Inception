#!/bin/bash


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
  cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;
 sed -i "s/database_name_here/wp_db/g" "/var/www/html/wp-config.php"
 sed -i "s/username_here/yismaili/g" "/var/www/html/wp-config.php"
 sed -i "s/password_here/1234/g" "/var/www/html/wp-config.php"
 sed -i "s/localhost/mariadb/g" "/var/www/html/wp-config.php"
	#  mv /var/www/wp-config.php /var/www/html/
	wp core install --allow-root --url='yismaili@42.fr' --title='wordpress' --admin_user='error' --admin_password='error1234' --admin_email='error1337@42.fr'
	wp user create --allow-root ${USER} ${USER_EMAIL} --user_pass= ${USER_PSSWRD};
	echo "Wordpress: set up!"
fi
exec "$@"