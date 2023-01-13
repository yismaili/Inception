FROM debian:buster
RUN apt-get update
RUN apt-get install -y wget 
RUN wget https://github.com/google/cadvisor/releases/download/v0.35.0/cadvisor  -O /usr/local/bin/cadvisor
RUN chmod +x /usr/local/bin/cadvisor
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/cadvisor", "--logtostderr"]
