
FROM debian:buster
RUN apt-get update && apt-get install vsftpd -y 
COPY ./tools /var/www/
RUN chmod +x /var/www/conf.sh

ENTRYPOINT [ "/var/www/conf.sh" ]
CMD [ "vsftpd", "/etc/vsftpd.conf" ]
