# Nginx Cheat Sheet
# Installation
# To install Nginx on a Linux system, you can use the following commands:

# Debian/Ubuntu
sudo apt-get update
sudo apt-get install nginx

# CentOS/RHEL
sudo yum install epel-release
sudo yum install nginx

# Configuration
# Nginx configuration files are located in the /etc/nginx directory. 
# The main configuration file is /etc/nginx/nginx.conf. 
# To edit the configuration, you can use a text editor such as nano or vi.

# Basic Configuration
# Here are some basic configuration settings for Nginx:

# Set the user and group that Nginx should run as
user nginx;
group nginx;

# Set the number of worker processes
worker_processes 2;

# Set the location of the error log file
error_log /var/log/nginx/error.log;

# Set the location of the access log file
access_log /var/log/nginx/access.log;

# Server Configuration
# To configure a server block in Nginx, you can use the following syntax:

server {
    listen 80;
    server_name example.com;
    root /var/www/example.com;
    
    location / {
        index index.html;
    }
}

# This configuration sets up a server block that listens on port 80 for requests to example.com. 
# The document root is set to /var/www/example.com, and the location block specifies 
# that requests for the root URL should be served with index.html.

# SSL Configuration
# To configure SSL in Nginx, you can use the following syntax:

server {
    listen 443 ssl;
    server_name example.com;
    root /var/www/example.com;
    
    ssl_certificate /etc/nginx/certs/example.com.crt;
    ssl_certificate_key /etc/nginx/certs/example.com.key;
    
    location / {
        index index.html;
    }
}

# This configuration sets up a server block that listens on port 443 for HTTPS requests to example.com. 
# The SSL certificate and key are specified using the ssl_certificate and ssl_certificate_key directives.

# Control
# To control Nginx on a Linux system, you can use the following commands:

# Start Nginx
sudo systemctl start nginx

# Stop Nginx
sudo systemctl stop nginx

# Restart Nginx
sudo systemctl restart nginx

# Reload Nginx configuration
sudo systemctl reload nginx

# Check Nginx configuration
sudo nginx -t

# Conclusion
# This cheat sheet covers some of the basic commands and configuration options for Nginx. 
# For more information, see the Nginx documentation at https://nginx.org/en/docs/.




Regenerate response
