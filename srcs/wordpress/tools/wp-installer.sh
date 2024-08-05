#!/bin/bash

#curl -O https://wordpress.org/latest.zip \
#    && unzip latest.zip \
#    && mv wordpress/* /var/www/html/ \
#    && chown -R www-data:www-data /var/www/html/ \
#    && chmod -R 755 /var/www/html/

if [ ! -f /var/www/html/wp-config.php ]; then
  curl -O https://wordpress.org/latest.zip
  unzip latest.zip
  mv wordpress/* /var/www/html/
  chown -R www-data:www-data /var/www/html/
  chmod -R 755 /var/www/html/
fi

exec "$@"

