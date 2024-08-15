# LAMP Stack Installation Script

This repository contains a script to set up a LAMP stack (Linux, Apache, MariaDB, PHP) along with phpMyAdmin on a Debian-based server. Follow the steps outlined below to install and configure each component.

## Prerequisites

- A server running a Ubuntu
- Root or sudo access to the server
- A domain name pointed to your server's IP address

## Script Overview

The script performs the following actions:

1. Updates and upgrades packages
2. Installs Apache web server
3. Configures UFW to allow Apache traffic
4. Installs MariaDB server
5. Secures the MariaDB installation
6. Installs PHP and necessary modules
7. Installs phpMyAdmin
8. Configures a virtual host for your domain
9. Installs and configures Certbot for SSL

## Customization

The script contains placeholders for `your_domain` that you need to replace with your actual domain name. Specifically, the following lines require customization:

- Creating a directory for your domain
- Assigning ownership of the directory
- Creating the domain configuration file
- Enabling the new virtual host
- Creating a test HTML file

## Conclusion

Using this script will set up a fully functional LAMP stack on your server, complete with a domain and SSL certificate. This configuration ensures a secure and manageable web hosting environment.
