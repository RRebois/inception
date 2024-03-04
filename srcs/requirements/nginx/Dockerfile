FROM debian:bullseye

#docker build ./ -t nginx

RUN apt update

RUN apt upgrade

RUN apt install nginx -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install OpenSSL -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj