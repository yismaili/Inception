FROM debian:buster
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64  -O /usr/local/bin/cadvisor
RUN chmod +x /usr/local/bin/cadvisor
ENTRYPOINT ["/usr/local/bin/cadvisor"]
