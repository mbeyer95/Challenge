#!/bin/bash

#echo "CONSUL_ADDRESS = ${consul_address}" > /tmp/iplist
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo service httpd enable
sudo yum install -y wget php-fpm php-mysqli php-json php php-devel
sudo yum install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
# Sie müssen einen Weg finden, den folgenden Befehl zu automatisieren, da er interaktiv ist.
# sudo mysql_secure_installation
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
