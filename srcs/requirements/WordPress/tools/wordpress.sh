#!/bin/bash
# 	mkdir -p /var/www/html
# 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# 	chmod +x wp-cli.phar; 
# 	mv wp-cli.phar /usr/local/bin/wp;
# exec "$@"
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
	mv /var/www/wp-config.php /var/www/html/
	wp core install --allow-root --url='yismaili@42.fr' --title='wordpress' --admin_user='error' --admin_password='error1234' --admin_email='error@42.fr'
	wp user create --allow-root 'yismaili' 'yismaili@42.fr' --user_pass='1234';
	echo "Wordpress: set up!"
fi

exec "$@"