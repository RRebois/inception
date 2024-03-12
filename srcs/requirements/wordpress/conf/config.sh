#!/bin/bash
sleep 10
if [ ! -f $/var/www/html/wordpress/wp-config.php ]
then
   cd /var/www/html/wordpress/  

   wp core download --allow-root

   wp config create --allow-root \
   --dbname=$DATABASE \
   --dbuser=$USER \
   --dbpass=$PASSWORD \
   --dbhost=$HOST

   wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ROOT_PASSWORD --admin_email=$ADMIN_MAIL
   wp user create --allow-root $USER_BIS $USER_BIS_MAIL --user_pass=$USER_BIS_PASS
    
 fi
   mkdir -p /run/php
   php-fpm7.4 -F

    mkdir -p /run/php
    /usr/sbin/php-fpm7.4 -F