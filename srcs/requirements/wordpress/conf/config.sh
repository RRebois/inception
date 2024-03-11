#! /bin/bash
sleep 10

if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
    cd /var/www/html/wordpress/  

    wp core download --allow-root

    # --dbname=mariadb \
    # --dbuser='rolando' \
    # --dbpass='inception' \
    # --dbhost=mariadb:3306 --path='/var/www/html/wordpress'
    wp config create --allow-root \
    --dbname=$DATABASE \
    --dbuser=$USERWP \
    --dbpass=$PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

    wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ROOT_PASSWORD --admin_email=$ADMIN_MAIL
    wp user create --allow-root $USER_BIS $USER_BIS_MAIL
fi

    mkdir -p /run/php
    /usr/sbin/php-fpm7.4 -F