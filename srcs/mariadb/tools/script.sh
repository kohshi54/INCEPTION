#!/bin/bash

#mkdir /docker-entrypoint-initdb.d/
#touch /docker-entrypoint-initdb.d/init.sql 
#chmod 666 /docker-entrypoint-initdb.d/init.sql 

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" >> /docker-entrypoint-initdb.d/init.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /docker-entrypoint-initdb.d/init.sql
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';" >> /docker-entrypoint-initdb.d/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> /docker-entrypoint-initdb.d/init.sql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" >> /docker-entrypoint-initdb.d/init.sql
echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.d/init.sql

exec mysqld --init-file=/docker-entrypoint-initdb.d/init.sql

