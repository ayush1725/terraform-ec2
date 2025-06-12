#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
if systemctl is-active --quiet nginx; then
    echo "Nginx is running."
else
    echo "Nginx is not running."
fi
# Create a simple HTML file to confirm installation
echo "<h1>Nginx installation completed and service started.</h1> " | sudo tee  /var/www/html/index.html

# Check if Nginx is running

