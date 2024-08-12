FROM debian:bullseye

RUN apt update -y \
    && apt install php-fpm -y \
    && apt install php-mysql -y \
    && apt install curl -y \
    && apt install unzip -y

RUN mkdir -p /var/www/html/

RUN curl -O https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && mv wordpress/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html/ \
    && chmod -R 755 /var/www/html/

#COPY tools/wp-installer.sh /usr/local/bin/wp-installer.sh
#RUN chmod +x /usr/local/bin/wp-installer.sh

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php

#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#    && chmod +x wp-cli.phar \
#    && mv wp-cli.phar /usr/local/bin/wp \
#    && wp core install --allow-root  --path=/var/www/html --url=kyamaguc.42.fr --title="WP-CLI" --admin_user=wordpress --admin_password=wordpress_password --admin_email=info@wp-cli.org

RUN apt clean

EXPOSE 9000
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#CMD ["/usr/local/bin/entrypoint.sh"]
#CMD ["php-fpm7.4", "--nodaemonize"]

