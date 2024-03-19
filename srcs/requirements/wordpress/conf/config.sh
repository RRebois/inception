#!/bin/bash
sleep 10
if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
  cd /var/www/html/wordpress/  

  wp core download --allow-root

  # Generates a wp-config.php file with database constants, and verifies that the database constants are correct
  wp config create --allow-root \
  --dbname=$DATABASE \
  --dbuser=$USER \
  --dbpass=$PASSWORD \
  --dbhost=$HOST

  # Runs the standard wp installation process
  wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ROOT_PASSWORD --admin_email=$ADMIN_MAIL
  
  # Create a new user
  wp user create --allow-root $USER_BIS $USER_BIS_MAIL --user_pass=$USER_BIS_PASS
    
 fi
 # To avoid php errors and starts php fastCGI process manager in the foreground
  mkdir -p /run/php
  php-fpm7.4 -F