#!/bin/bash
# -----------------------------------------------------------------------------
# Ubuntu - LAMP
# Tested on Ubuntu 22.04 LTS - Ubuntu 24.04 LTS
# Install & Setup: Apache, MariaDB, PHP, PHPMyAdmin & Let's Encrypt
# Made under a rainbow by nextproject.sh
# -----------------------------------------------------------------------------

# Update and upgrade packages
sudo apt update

# Install Apache
sudo apt install -y apache2

# Allow Apache in UFW
sudo ufw allow "Apache Full"

# Install MariaDB Server
sudo apt install -y mariadb-server

# Start MariaDB Service
sudo systemctl start mariadb

# Enable MariaDB to start on boot
sudo systemctl enable mariadb

# Secure your MariaDB installation
sudo mysql_secure_installation

# Install PHP
sudo apt install -y php libapache2-mod-php php-mysql

# Install phpMyAdmin
sudo apt install -y phpmyadmin

# Create a directory for the domain <<<Requires Customization>>>
sudo mkdir /var/www/your_domain

# Assign ownship of the directory to your current user <<<Requires Customization>>>
sudo chown -R $USER:$USER /var/www/your_domain

# Create domain config file <<<Requires Customization>>>
sudo tee -a /etc/apache2/sites-available/your_domain.conf << EOF
<VirtualHost *:80>
    ServerName your_domain
    ServerAlias www.your_domain
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/your_domain
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Enable new virtual host <<<Requires Customization>>>
sudo a2ensite your_domain

# Disable Apache default website
sudo a2dissite 000-default

# Check if config file contains syntax errors
sudo apache2ctl configtest

# Reload Apache
sudo systemctl reload apache2

# Create a HTML file to test the virtual host <<<Requires Customization>>>
sudo cat >> /var/www/your_domain/index.html << EOF
<html>
  <head>
    <title>your_domain website</title>
  </head>
  <body>
    <h1>Hello World!</h1>

    <p>This is the landing page of <strong>your_domain</strong>.</p>
  </body>
</html>
EOF

# Install Certbot
sudo apt install -y certbot python3-certbot-apache

# Ask SSL Certificate
sudo certbot --apache

# Check Certbot Status
sudo systemctl status certbot.timer

# Check Renewal
sudo certbot renew --dry-run