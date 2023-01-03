FROM debian:buster

RUN apt update && apt install -y mariadb-server

EXPOSE 3360

COPY tools /var/www/
RUN chmod +x /var/www/add_db.sh
# RUN touch /var/www/create_db.sql
RUN sed -i 's/bind-address/#bind-adress/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start
ENTRYPOINT [ "/var/www/add_db.sh" ]
#  RUN service mysql start && mysql < /var/www/create_db.sql && rm -rf /var/www/init_db.sql
CMD ["tail","-f" , "/dev/null"]
