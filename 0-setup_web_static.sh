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
adding="\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n\t}"
sed -i "/$found/a\\$adding" /etc/nginx/sites-available/default
service nginx restart
