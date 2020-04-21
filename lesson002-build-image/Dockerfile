FROM ubuntu:18.04
RUN  apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/list/*
CMD ["curl","-s","https://ip.cn"]