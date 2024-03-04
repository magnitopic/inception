FROM debian:bullseye

RUN apt update && apt install nginx -y

RUN mkdir -p /var/www/html

CMD ["nginx", "-g", "daemon off;"]
