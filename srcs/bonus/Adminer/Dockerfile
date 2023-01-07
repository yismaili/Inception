FROM debian:buster

RUN apt update && apt install  php php-curl php-cli php-mysql php-gd -y && apt install -y wget
COPY  ./tool/conf.sh /tmp/conf.sh
RUN chmod +x /tmp/conf.sh
ENTRYPOINT [ "/tmp/conf.sh" ]
CMD [ "php","-S","0.0.0.0:8282", "-t","/var/www/html/" ]