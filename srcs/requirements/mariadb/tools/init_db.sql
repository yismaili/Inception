
CREATE DATABASE wp_db;
CREATE OR REPLACE USER 'yismaili'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wp_db.* TO 'yismaili'@'%';
FLUSH PRIVILEGES;