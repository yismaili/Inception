FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3360

COPY tools /var/www/
RUN service mysql start && mysql < /var/www/init_db.sql && rm -rf /var/www/init_db.sql
CMD ["mysqld"]
