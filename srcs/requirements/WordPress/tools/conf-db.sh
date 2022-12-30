 #!/bin/bash
 
 sed -i "s/define( 'DB_NAME', 'database_name_here' );/define('DB_NAME', 'wp_db');/g" "/var/www/html/wp-config-sample.php"
 sed -i "s/define( 'DB_USER', 'username_here' );/define('DB_USER', 'yismaili');/g" "/var/www/html/wp-config-sample.php"
 sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define('DB_PASSWORD', '1234');/g" "/var/www/html/wp-config-sample.php"
 sed -i "s/define( 'DB_HOST', 'localhost' );/define('DB_HOST', 'mariadb');/g" "/var/www/html/wp-config-sample.php"