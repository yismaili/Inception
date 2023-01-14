#!bin/bash
    sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0 ::1/g" "/etc/redis/redis.conf"
    echo "maxmemory 256mb" >> /etc/redis/redis.conf
    echo "maxmemory-policy allkeys-lru" >> etc/redis/redis.conf
exec "$@"