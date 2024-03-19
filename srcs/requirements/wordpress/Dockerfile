FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget -y

RUN apt-get install -y php php-fpm php-mysql mariadb-client

RUN mkdir -p /var/www/html/wordpress/

#wp-cli allows to auto config wp init pages 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/bin/wp

COPY ./conf/wordpress.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh
CMD ["config.sh"]
