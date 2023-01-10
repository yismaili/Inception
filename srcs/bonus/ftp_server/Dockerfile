
# FROM debian:buster

# RUN apt-get update && \
#     apt-get install -y vsftpd
# COPY ./tools /var/www/
# RUN chmod +x /var/www/conf.sh
# EXPOSE 21
# EXPOSE 20
# ENTRYPOINT ["/var/www/conf.sh"]
# CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]

FROM debian:buster
RUN apt-get update && apt-get install vsftpd -y 
COPY tools /var
RUN chmod -R 777 /var/conf.sh
ENTRYPOINT [ "/var/conf.sh" ]

CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
