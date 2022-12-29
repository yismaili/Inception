FROM debian:buster

RUN apt update && apt install -y mariadb-server

EXPOSE 3360

COPY tools /var/www/
RUN service mysql start && mysql < /var/www/init_db.sql && rm -rf /var/www/init_db.sql
RUN sed -i 's/bind-address/#bind-adress/' /etc/mysql/mariadb.conf.d/50-server.cnf
CMD ["mysqld"]
