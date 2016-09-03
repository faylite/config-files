#!/usr/bin/env bash

# Some vars
PASSWORD='s9pe854yugt9e84gh'

# Set MySQL root password
debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"

# Update package list
apt-get update

# Add PHP ppa
apt-get install python-software-properties
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y

# Update package list
apt-get update

# Install apache web server
apt-get install -y apache2
# Install php 7
apt-get install -y php7.0 php7.0-cli php7.0-common php7.0-fpm php7.0-mysql php7.0-mbstring php7.0-gd
# Install apache php module
apt-get install -y libapache2-mod-php7.0
# Install mysql server
apt-get install -y mysql-server-5.5

# Configure PHP
sed -i '/display_errors = Off/c display_errors = on' /etc/php5/apache2/php.ini
sed -i '/error_reporting = E_ALL & ~E_DEPRECATED/c error_reporting = E_ALL | E_STRICT' /etc/php5/apache2/php.ini
sed -i '/html_errors = Off/c html_errors = on' /etc/php5/apache2/php.ini

# Setup vhosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/site/public

	<Directory /var/www/site/public>
		AllowOverride all
		Require all granted
	</Directory>

	ErrorLog \${APACHE_LOG_DIR}/error.log
	CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
)

echo "$VHOST" > /etc/apache2/sites-available/000-default.conf

# Enable mod_rewrite
sudo a2enmod rewrite

# Restart apache2
service apache2 restart
