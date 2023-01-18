FROM debian:buster
RUN apt update
RUN apt  install -y nginx openssl  
COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/ssl.sh /var/www/
RUN chmod +x /var/www/ssl.sh
ENTRYPOINT [ "/var/www/ssl.sh" ]
CMD ["nginx", "-g", "daemon off;"]

