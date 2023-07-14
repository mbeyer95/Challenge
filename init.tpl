#!/bin/bash

#echo "CONSUL_ADDRESS = ${consul_address}" > /tmp/iplist
sudo yum update -y
sudo yum install -y nginx
sudo service nginx start
sudo yum install -y httpd wget php-fpm php-mysqli php-json php php-devel
sudo yum install mariadb105-server
sudo systemctl start mariadb
# Sie müssen einen Weg finden, den folgenden Befehl zu automatisieren, da er interaktiv ist.
# sudo mysql_secure_installation
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
