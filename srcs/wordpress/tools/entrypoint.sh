#!/bin/bash

if ! [ -f /var/www/html/wp-config.php ]; then
  mkdir -p /var/www/html/
  
  curl -O https://wordpress.org/latest.zip \
      && unzip latest.zip \
      && mv wordpress/* /var/www/html/ \
      && chown -R www-data:www-data /var/www/html/ \
      && chmod -R 755 /var/www/html/
  
  sed -i "s/dbname/${MYSQL_DATABASE}/" /wp-config.php
  sed -i "s/dbuser/${MYSQL_USER}/" /wp-config.php
  sed -i "s/dbpassword/${MYSQL_PASSWORD}/" /wp-config.php
  
  mv /wp-config.php /var/www/html/wp-config.php
  
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  wp core install --allow-root --path=/var/www/html --url=${WP_URL} --title="WP-CLI" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
  
fi

exec php-fpm7.4 --nodaemonize

