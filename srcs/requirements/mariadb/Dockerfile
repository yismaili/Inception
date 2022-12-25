FROM debian:buster

RUN apt update && apt install -y mariadb-server

EXPOSE 3360

COPY tools /var/www/
RUN service mysql start && mysql < /var/www/init_db.sql && rm -rf /var/www/init_db.sql
CMD ["mysqld"]
