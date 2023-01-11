
FROM debian:buster
RUN apt-get update && apt-get install vsftpd -y 
COPY ./tools /var/www/
RUN chmod +x /var/www/conf.sh

ENTRYPOINT [ "/var/www/conf.sh" ]
EXPOSE 21
EXPOSE 20
CMD [ "vsftpd", "/etc/vsftpd.conf" ]
