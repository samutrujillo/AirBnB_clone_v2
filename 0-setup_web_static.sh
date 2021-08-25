#!/usr/bin/env bash
# Script to configure servers
apt-get update && apt-get -y install nginx
mkdir -p /data/web_static/releases/test
mkdir /data/web_static/shared
echo '
<html>
	<head><title>Hello</title></head>
	<body><h1>Fake body</h1></body>
</html>' > /data/web_static/releases/test/index.html
ln -s /data/web_static/releases/test/ /data/web_static/current
chown ubuntu /data/
chown :ubuntu /data/
found="server_name _;"
adding="\n\tlocation /static/ {\n\t\talias /data/web_static/current/\n\t\tautoindex off;\n\t}"
sed -i "/$found/a\\$adding" /etc/nginx/sites-available/default
service nginx restart
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpJUvI3G5oiVtuzRkZQxfZlO3GV1Xy0yegt8hJQ1mhHwLvhSrXzZucU259GQSs6PI5AchohvmQv/xg9saFZWgi42WcWN0gS4rs1oHUhqVxpWx0hPmY8A0ZnjQ+kfOCpVBfAFTQVaawUFP5B49L84WSmbLBHJGlvzPMDhi31VKlKmquTXQ/y2jxcB6B/i6tflf2384579+8LZ3dwPeWDSFzNyvy/07WknQ5OsKs//d2ih3ooGSs7rCzyZVMQ6s4nJUF1azxH2H15H02OIejmj2Ouja1PwDYgtmY9tsb6Rv6GANe+ZwG9u5hl22+SuH06WNR07nxP79/zF4Z2I33q9yb manuel@debian
