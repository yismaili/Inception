
FROM debian:buster

RUN apt update
RUN apt -y install php7.3 php-mysqli php-fpm wget sendmail
# RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"

# COPY ./conf/wp-config.php /var/www/
COPY ./tools /var/www/
RUN chmod +x /var/www/wordpress.sh

EXPOSE 9000

ENTRYPOINT [ "/var/www/wordpress.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]


