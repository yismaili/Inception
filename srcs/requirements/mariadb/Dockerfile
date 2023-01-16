FROM debian:buster

RUN apt update && apt install -y mariadb-server
COPY tools /var/www/
RUN chmod +x /var/www/add_db.sh
RUN sed -i 's/bind-address/#bind-adress/' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT [ "/var/www/add_db.sh" ]