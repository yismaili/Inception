#!/bin/bash
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid; #Store PID files for PHP processes managed by the PHP-FPM
	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
 if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; #download wp-cli (WordPress Command Line Interface pour managing your site)
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp; # you might use the wp plugin install command to install a plugin, or the wp theme list command to list the installed themes.
	cd /var/www/html;
	wp core download --allow-root; #download the latest version of WordPress  and The --allow-root option allows the command to be executed by the root user
	touch /var/www/html/wp-config.php;
	sed -i "s/database_name_here/${DB_NAME}/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/username_here/${DB_USER}/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/password_here/${DB_PSSWRD}/g" "/var/www/html/wp-config-sample.php"
	sed -i "s/localhost/${DB_HOST}/g" "/var/www/html/wp-config-sample.php"
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;
	# install WordPress using the specified options
	wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PSSWRD --admin_email=$ADMIN_EMAIL
	wp user create --allow-root ${DB_USER} ${USER_EMAIL} --user_pass=${DB_PSSWRD}; # create a new user for your WordPress site
    wp plugin install  --allow-root redis-cache --activate
   	wp redis  --allow-root enable
	wp config set WP_REDIS_HOST ${REDIS_HOST} --allow-root
	wp config set WP_REDIS_PORT ${REDIS_PORT} --allow-root
	wp config set WP_CACHE ${REDIS_CACHE} --allow-root
	echo "Installation successful !"
 fi
exec "$@"