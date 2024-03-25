FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY ./script/config.sh /app/config.sh

WORKDIR /app

RUN chmod +x /app/config.sh

CMD ["/app/config.sh"]
