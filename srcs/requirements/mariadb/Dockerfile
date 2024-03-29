FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY ./tools/my.cnf /etc/mysql/my.cnf

COPY ./script/config.sh /app/config.sh

WORKDIR /app

RUN chmod +x /app/config.sh

CMD ["/app/config.sh"]
