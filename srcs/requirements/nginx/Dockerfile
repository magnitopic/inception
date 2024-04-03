FROM debian:bullseye

RUN apt update && apt install nginx -y

RUN mkdir -p /var/www/html

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

