#!/bin/bash

# Update packages
sudo yum update -y

# Install httpd and start/enable it
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Install necessary PHP packages
sudo yum install -y wget php-fpm php-mysqli php-json php php-devel

# Install mariadb-server and start/enable it
sudo yum install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Download and extract WordPress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# Move WordPress files to Apache directory
sudo mv wordpress/* /var/www/html/

# Create WordPress database
# Remember to replace 'password' with your actual password
mysql -u root -p -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"

# Copy WordPress sample configuration file
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Replace database details in wp-config.php
# Please replace 'password' with your actual password
sudo sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php
sudo sed -i "s/username_here/wordpressuser/g" /var/www/html/wp-config.php
sudo sed -i "s/password_here/password/g" /var/www/html/wp-config.php

