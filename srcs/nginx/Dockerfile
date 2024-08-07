FROM debian:bullseye

RUN apt update \
	&& apt install nginx -y \
	&& apt install openssl -y \
	&& mkdir /etc/nginx/ssl \
	&& openssl genrsa -out /etc/nginx/ssl/server.key 2048 \
	&& openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/CN=localhost" \
	&& openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt

RUN apt clean

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

