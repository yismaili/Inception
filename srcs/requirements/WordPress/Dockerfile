FROM debian:buster
RUN apt update
RUN apt -y install php7.3 php-mysqli php-fpm wget sendmail
COPY ./tools/wordpress.sh /var/www/
RUN chmod +x /var/www/wordpress.sh
ENTRYPOINT [ "/var/www/wordpress.sh" ]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]