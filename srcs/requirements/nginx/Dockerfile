FROM debian

RUN apt update

RUN apt  install -y nginx openssl  &&  openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=MO/ST=khouribga/L=khouribga/O=wordpress/CN=yismaili.42.fr"
EXPOSE 443
COPY ./conf/default /etc/nginx/sites-enabled/default
# RUN mkdir -p /var/www/html/bonus
# COPY ../../bonus/website/index.html /var/www/html/bonus
CMD ["nginx", "-g", "daemon off;"]

