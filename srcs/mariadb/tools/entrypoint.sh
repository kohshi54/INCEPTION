#!/bin/bash
set -e

# Start MariaDB server in the background
mysqld_safe &
pid="$!"

# Function to check if MariaDB is up
function wait_for_db() {
    until mysqladmin ping -h "localhost" --silent; do
        echo 'waiting for mysqld to be connectable...'
        sleep 2
    done
}

# Wait for MariaDB to start
wait_for_db

# Create a new database and user
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS wordpress;
    CREATE USER IF NOT EXISTS 'wordpress_user'@'%' IDENTIFIED BY 'wordpress_password';
    GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'%';
    FLUSH PRIVILEGES;
EOSQL

echo "Database and user created."

mysqladmin shutdown
# Wait for the background mysqld process to end
wait "$pid"

