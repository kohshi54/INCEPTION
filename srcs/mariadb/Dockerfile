FROM debian:bullseye

RUN apt update \
    && apt install mariadb-server -y

RUN mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./conf/init.sql /docker-entrypoint-initdb.d/
COPY ./conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306
USER mysql
CMD ["mysqld", "--init-file=/docker-entrypoint-initdb.d/init.sql"]

