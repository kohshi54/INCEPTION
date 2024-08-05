FROM debian:bullseye

RUN apt update \
	&& apt install mariadb-server -y

RUN mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
COPY ./tools/entrypoint.sh /usr/local/bin/
COPY ./conf/my.cnf /etc/mysql/my.cnf
RUN chmod +x /usr/local/bin/entrypoint.sh
EXPOSE 3306
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

