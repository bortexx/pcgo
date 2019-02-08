#!/bin/bash

node-sass ../public_html/scss/*.scss -o ../public_html/css/
tsc ../public_html/js/*.ts
rm -r C:/xampp/xampp/htdocs/pcgo
mkdir C:/xampp/xampp/htdocs/pcgo
cp -r ../public_html/*  C:/xampp/xampp/htdocs/pcgo
rm -r C:/xampp/xampp/htdocs/pcgo/scss
rm -f C:/xampp/xampp/htdocs/pcgo/js/*.ts

