#!/bin/bash

node-sass C:/Users/Alumno/Desktop/pcgo/public_html/scss/*.scss -o C:/Users/Alumno/Desktop/pcgo/public_html/css
tsc C:/Users/Alumno/Desktop/pcgo/public_html/js/*.ts
rm -r C:/xampp/htdocs/pcgo
mkdir C:/xampp/htdocs/pcgo
cp -r C:/Users/Alumno/Desktop/pcgo/public_html/*  C:/xampp/htdocs/pcgo/
rm -r C:/xampp/htdocs/pcgo/scss
rm -f C:/xampp/htdocs/pcgo/js/*.ts

