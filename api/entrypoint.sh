#!/bin/sh
cd /app/

# Wait for the MySQL server to start
while ! mysqladmin ping -h"$MYSQL_HOST" -P"$MYSQL_PORT" --silent; do
    sleep 1
done

# Wait for the MySQL server to be ready
until mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e 'SELECT 1'; do
    sleep 1
done

until mysql -h"$MYSQL_HOST" -P"$MYSQL_PORT" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"; do
    sleep 1
done

echo "----------APPYING DATABASE MIGRATIONS-------------"
python manage.py migrate --noinput || true

echo "----------CREATING SUPERUSER----------------------"
python manage.py createsuperuser --email ${DJANGO_SUPERUSER_EMAIL} --noinput || true

echo "------STARTING GUNICORN AT 0.0.0.0:${DJANGO_PORT}--"
gunicorn tawi.wsgi:application --worker-tmp-dir /dev/shm --reload --bind "0.0.0.0:${DJANGO_PORT}"


