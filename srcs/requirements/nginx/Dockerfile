FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN mkdir /etc/nginx/ssl

COPY ./script/ssl.sh .

RUN chmod +x ssl.sh

#CMD ["./ssl.sh"]

CMD ["tail", "-f"]
