FROM debian:bullseye

RUN apt update && apt install nginx -y

RUN mkdir -p /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
