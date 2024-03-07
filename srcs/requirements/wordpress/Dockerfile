FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install wget -y

RUN apt-get install -y php php-fpm php-mysql mariadb-client \
&& wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar -xzf wordpress-6.4-fr_FR.tar.gz && rm wordpress-6.4-fr_FR.tar.gz
&& chown -R root:root /var/www/wordpress