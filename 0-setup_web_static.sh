#!/usr/bin/env bash
<<<<<<< HEAD
# script

# install nginx
sudo apt-get update
sudo apt-get -y install nginx

#create folders
sudo mkdir /data/
sudo mkdir /data/web_static/
sudo mkdir /data/web_static/releases/
sudo mkdir /data/web_static/shared/
sudo mkdir /data/web_static/releases/test/

# Create a fake HTML file
echo "<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

#simbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

#ownership and group
sudo chown -R ubuntu:ubuntu /data

#routing to web static
sudo sed -i '/listen 80 default_server;/a location /hbnb_static/ { alias /data/web_static/current/; }' /etc/nginx/sites-available/default

#restart nginx
sudo service nginx restart
=======
# Script to configure servers
apt-get update && apt-get -y install nginx
mkdir -p /data/web_static/releases/test
mkdir -p /data/web_static/shared
echo '
<html>
	<head><title>Hello</title></head>
	<body><h1>Fake body</h1></body>
</html>' > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data/
found="server_name _;"
adding="\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n\t}"
sed -i "/$found/a\\$adding" /etc/nginx/sites-available/default
service nginx restart
>>>>>>> 6eba06a37a5add59f8d63ec694c9c491d683bdab
