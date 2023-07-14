#!/bin/bash

#echo "CONSUL_ADDRESS = ${consul_address}" > /tmp/iplist
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install -y wget php-fpm php-mysqli php-json php php-devel
sudo yum install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
# Sie müssen einen Weg finden, den folgenden Befehl zu automatisieren, da er interaktiv ist.
# sudo mysql_secure_installation
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo mv wordpress/* /var/www/html/
# Ersetzen Sie 'password' durch Ihr tatsächliches Passwort.
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;" | mysql -u root -p

