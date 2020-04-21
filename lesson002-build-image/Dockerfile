

FROM ubuntu:18.04
RUN RUN echo 'Acquire::http::Proxy “http://yourproxyaddress:proxyport”;' > /etc/apt/apt.conf \
	&&apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/list/*
CMD ["curl","-s","https://ip.cn"]