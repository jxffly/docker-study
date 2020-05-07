NGINX_ENV_DIR="/data/nginx"
if [ ! -d ${NGINX_ENV_DIR} ]; then
   echo "the dir ${NGINX_ENV_DIR} NOT EXIST"
   mkdir NGINX_ENV_DIR/conf
   cp ./nginx.conf ${NGINX_ENV_DIR}/conf/
   mkdir NGINX_ENV_DIR/log
else
	echo "the dir ${NGINX_ENV_DIR} EXIST"
fi

docker run --name mynginx -d -p 80:80  -v /nginx/conf/nginx.conf:${NGINX_ENV_DIR}/conf/nginx.conf  -v /nginx/logs:/${NGINX_ENV_DIR}/log -d nginx:v3
