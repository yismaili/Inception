FROM debian:buster

RUN apt-get update / apt-get install -y mariadb-server

EXPOSE 3360

COPY ./conf/file.cnf / etc/mysql/mariadb.cnf.f/
COPY .tools /var/www/
RUN service mysql start
CMD ["mysqld"]