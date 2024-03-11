#! /bin/bash
# sleep 10
if [ ! -f $/var/www/html/wordpress/wp-config.php ]
then
    cd /var/www/html/wordpress/
fi   

    wp core download --allow-root

    wp config create --allow-root \
    --dbname=$DATABASE \
    --dbuser=$USER \
    --dbpass=$PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

    wp core install --allow-root --url=$URL --title=$TITLE --admin=$ADMIN --admin_password=$ROOT_PASSWORD --admin_email=$ADMIN_MAIL
    wp user create --allow-root test test@example.com --role=$CLIENT 
    /usr/sbin/php-fpm7.4 -F

