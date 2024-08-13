CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wordpress_user'@'%' IDENTIFIED BY 'wordpress_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root-password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';

FLUSH PRIVILEGES;

