#!/usr/bin/env bash

# Some vars
PASSWORD='root'

# Set MySQL root password
debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"

# Update package list
apt-get update

# Install apache2 php5, and mysql
apt-get install -y apache2
apt-get install -y php5
apt-get install -y mysql-server-5.5 php5-mysql

# Link the default www dir to the shared vagrant dir
if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www
fi

# Configure PHP
sed -i '/display_errors = Off/c display_errors = on' /etc/php5/apache2/php.ini
sed -i '/error_reporting = E_ALL & ~E_DEPRECATED/c error_reporting = E_ALL | E_STRICT' /etc/php5/apache2/php.ini
sed -i '/html_errors = Off/c html_errors = on' /etc/php5/apache2/php.ini

# Restart apache2
service apache2 restart
