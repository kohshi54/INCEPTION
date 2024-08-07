CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wordpress_user'@'%' IDENTIFIED BY 'wordpress_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'%';

CREATE USER IF NOT EXISTS 'wp_manager'@'%' IDENTIFIED BY 'root_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_manager'@'%';

FLUSH PRIVILEGES;

