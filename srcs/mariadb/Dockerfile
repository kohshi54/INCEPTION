FROM debian:bullseye

RUN apt update \
    && apt install mariadb-server -y

RUN mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

RUN apt clean

COPY ./tools/script.sh /usr/local/bin/script.sh
RUN mkdir /docker-entrypoint-initdb.d/ \
    && touch /docker-entrypoint-initdb.d/init.sql \
    && chmod 777 /docker-entrypoint-initdb.d/init.sql \
    && chmod +x /usr/local/bin/script.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306
USER mysql
CMD ["/usr/local/bin/script.sh"]
#CMD ["mysqld", "--init-file=/docker-entrypoint-initdb.d/init.sql"]

