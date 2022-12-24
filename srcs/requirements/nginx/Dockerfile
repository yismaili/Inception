FROM debian

RUN apt-get update
RUN apt-get install apt-utils

RUN apt-get -yq install nginx openssl

EXPOSE 443

COPY ./tools/nginx_ssl.sh/ var/www
RUN chmod +x /var/www/nginx_ssl.sh

ENTRYPOINT [ "var/www/nginx_ssl.sh"]
CMD ["/usr/local/bin/ssl-setup.sh", "nginx", "-g", "daemon off;"]
