#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core install --allow-root  --path=/var/www/html --url=kyamaguc.42.fr --title="WP-CLI" --admin_user=wordpress --admin_password=wordpress_password --admin_email=info@wp-cli.org

exec php-fpm7.4 --nodaemonize

