FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install wget -y

RUN apt-get install -y php php-fpm php-mysql mariadb-client

COPY conf/wordpress.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/wordpress/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY conf/config.sh /conf/config.sh
RUN chmod +x /conf/config.sh
ENTRYPOINT ["/conf/config.sh"]

CMD ["wordpress"]
