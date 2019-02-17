node-sass ../public_html/scss/*.scss -o ../public_html/css
tsc ../public_html/js/*.ts
rm -r ../../../www/*
cp -r ../public_html/* ../../../www/
rm -r ../../../www/scss
rm -f ../../../www/js/*.ts
