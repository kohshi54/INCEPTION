#!/bin/bash

if [ -f /wp-config.php ]; then
  mv /wp-config.php /var/www/html/wp-config.php
  sudo sed -i "s/dbname/${MYSQL_DATABASE}/" /var/www/html/wp-config.php
  sudo sed -i "s/dbuser/${MYSQL_USER}/" /var/www/html/wp-config.php
  sudo sed -i "s/dbpassword/${MYSQL_PASSWORD}/" /var/www/html/wp-config.php
  
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  wp core install --allow-root --path=/var/www/html --url=${WP_URL} --title="WP-CLI" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
  
fi

exec php-fpm7.4 --nodaemonize

