#!/bin/bash
docker container stop pcgo_apache
docker container stop pcgo_database
docker container rm pcgo_apache
docker container rm pcgo_database
docker container run \
-v /opt/webapps/pcgo/www:/var/www/html \
--name pcgo_apache \
--expose 80 \
-e VIRTUAL_HOST=pcgo.pve2.fpmislata.com \
--net "nginx-net" \
--restart always \
-d \
php:7.2-apache
docker exec -it pcgo_apache docker-php-ext-install pdo pdo_mysql
docker container exec -it pcgo_apache a2enmod rewrite
docker container run \
-p 3303:3306 \
-v /opt/webapps/pcgo/database:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=root \
--name pcgo_database \
--net "nginx-net" \
--restart always \
-d \
mariadb:10.1

docker container restart pcgo_apache

node-sass ../public_html/scss/*.scss -o ../public_html/css
tsc ../public_html/js/*.ts
rm -r ../../../www/*
cp -r ../public_html/* ../../../www/
rm -r ../../../www/scss
rm -f ../../../www/js/*.ts

