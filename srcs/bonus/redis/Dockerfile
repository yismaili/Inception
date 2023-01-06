FROM debian:buster
RUN apt update
RUN apt install -y redis


# RUN sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0 ::1/g' /etc/redis/redis.conf
RUN sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf  
RUN sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf  
RUN sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf 
RUN sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf
EXPOSE 6379

CMD ["redis", "/etc/redis/redis.conf"]
