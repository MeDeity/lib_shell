ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
SELECT plugin FROM mysql.user WHERE User = 'root';
show VARIABLES like ‘%max_allowed_packet%’;
set global max_allowed_packet = 210241024*10;
create database video;
create database videocms;
create database videoupms;