FROM ubuntu:18.04
ENV HTTP_PROXY "http://devnet-proxy.oa.com:8080"
ENV HTTPS_PROXY "http://devnet-proxy.oa.com:8080"

RUN  apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/list/*
CMD ["curl","-s","https://ip.cn"]