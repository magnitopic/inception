FROM alpine:3.18

RUN apk update && apk add mariadb

COPY ./tools/my.cnf /etc/my.cnf
COPY ./tools/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chown -R mysql: /var/lib/mysql
RUN chmod 777 /var/lib/mysql

RUN mysql_install_db >/dev/null 2>&1

CMD ["mysqld_safe"]
