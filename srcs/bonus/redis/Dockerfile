FROM debian:buster
RUN  apt update && apt install -y redis-server && apt install -y php-redis
COPY ./tool /var/www/
RUN chmod +x /var/www/conf.sh
ENTRYPOINT [ "/var/www/conf.sh" ]
CMD ["redis-server", "--protected-mode", "no"]