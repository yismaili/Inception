FROM debian:buster
RUN apt update
RUN apt  install -y nginx openssl  &&  openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=MO/ST=khouribga/L=khouribga/O=wordpress/CN=yismaili.42.fr"
COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/ssl.sh /var/www/
RUN chmod +x /var/www/ssl.sh
ENTRYPOINT [ "/var/www/ssl.sh" ]
CMD ["nginx", "-g", "daemon off;"]

