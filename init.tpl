#!/bin/bash

# Update packages
sudo yum update -y

# Install httpd and start/enable it
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Install necessary PHP packages
sudo yum install -y wget php-fpm php-mysqli php-json php-devel php

# PHP start/enable it
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Install PHP 7.4
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install -y php

# Restart Apache Server
sudo systemctl restart httpd

# Install mariadb-server and start/enable it
sudo yum install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Download and extract WordPress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# Move WordPress files to Apache directory
sudo mv wordpress/* /var/www/html/

# Set database name
DB_NAME="Wordpress-DB"

# Set my DB_User
DB_USER="Maxey"

# Set my passwords
DB_PASSWORD="Yq5jk8tGXhP33kHM"
WP_PASSWORD="JH3zLgM34gm77tGZ"

# Create WordPress database
mysql -u root -p -e "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;"

# Write Permission wp-config.php
sudo chmod u+w /var/www/html/wp-config.php

# Copy WordPress sample configuration file to wp-config.php
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Replace database details in wp-config.php
sudo sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wp-config.php
sudo sed -i "s/username_here/$DB_USER/g" /var/www/html/wp-config.php
sudo sed -i "s/password_here/$DB_PASSWORD/g" /var/www/html/wp-config.php

# Delete write permission wp-config.php
sudo chmod u-w /var/www/html/wp-config.php
