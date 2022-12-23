FROM debian

RUN apt-get update
RUN apt-get install -y nginx opensll

EXPOSE 443

COPY ./tools/nginx.sh/ var/www
RUN chmod +x/var/www/nginx.sh

ENTRYPOINT [ "var/www/nginx.sh"]
CMD ["/usr/local/bin/ssl-setup.sh", "nginx", "-g", "daemon off;"]
