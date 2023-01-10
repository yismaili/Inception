FROM debian:buster

RUN  apt update && apt install -y redis-server && apt install -y php-redis

RUN sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0 ::1/g' /etc/redis/redis.conf

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]