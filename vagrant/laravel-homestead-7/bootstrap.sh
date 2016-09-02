#!/usr/bin/env bash

apt-get update

# Setup vhosts file to point ot vagrant shared directory
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
a2enmod rewrite

# Restart apache2
service apache2 restart
