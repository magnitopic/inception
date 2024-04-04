FROM debian:bullseye

RUN apt update && apt install -y nginx

COPY conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
