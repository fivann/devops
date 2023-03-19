#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root or with sudo."
  exit
fi

if [ -z "$1" ] || [ -z "$2" ]
  then echo "Usage: ./install_ssl.sh your_domain.com nginx_config_path"
  exit
fi

YOUR_DOMAIN="$1"
NGINX_CONFIG_PATH="$2"

# Install Certbot and the Nginx plugin
if [ -f "/etc/debian_version" ]; then
  apt-get update
  apt-get install -y software-properties-common
  add-apt-repository -y universe
  add-apt-repository -y ppa:certbot/certbot
  apt-get update
  apt-get install -y certbot python3-certbot-nginx
elif [ -f "/etc/redhat-release" ]; then
  yum install -y epel-release
  yum install -y certbot python-certbot-nginx
else
  echo "Unsupported OS."
  exit
fi

# Configure Nginx
sed -i "/listen 80;/a \    server_name $YOUR_DOMAIN www.$YOUR_DOMAIN;" $NGINX_CONFIG_PATH

# Test and reload Nginx configuration
nginx -t && systemctl reload nginx

# Obtain SSL certificate and configure Nginx
certbot --nginx -d $YOUR_DOMAIN -d www.$YOUR_DOMAIN

# Configure automatic certificate renewal
(crontab -l 2>/dev/null; echo "0 3 * * * /usr/bin/certbot renew --quiet --post-hook \"systemctl reload nginx\"") | crontab -

echo "SSL certificate installation complete."


# sudo ./install_ssl.sh your_domain.com /path/to/nginx/sites-available/your_domain.conf

# Replace your_domain.com with your actual domain name and 
# /path/to/nginx/sites-available/your_domain.conf with the path to your Nginx configuration file.

# Please note that this script will work for most basic configurations, 
# but it might require modification for more complex setups. 
# Additionally, the script does not perform error checking at each step, 
# so be sure to verify each step's success in the terminal output.



