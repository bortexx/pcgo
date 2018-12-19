#!/bin/bash

node-sass D:/Desktop/pcgo/public_html/scss/*.scss -o D:/Desktop/pcgo/public_html/css
tsc D:/Desktop/pcgo/public_html/js/*.ts
rm -r C:/xampp/htdocs/pcgo
mkdir C:/xampp/htdocs/pcgo
cp -r D:/Desktop/pcgo/public_html/*  C:/xampp/htdocs/pcgo/
rm -r C:/xampp/htdocs/pcgo/scss
rm -f C:/xampp/htdocs/pcgo/js/*.ts

