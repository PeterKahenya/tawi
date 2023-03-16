#!/bin/sh
echo "Preparing TAWI Server..."

echo $API_URL

cat /app/nginx.conf

sed -i "s|APIURL|${API_URL}|g" /app/nginx.conf

cat /app/nginx.conf

cp /app/nginx.conf /etc/nginx/nginx.conf

cat /etc/nginx/nginx.conf

nginx -s reload

nginx -g "daemon off;"
