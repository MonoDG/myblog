FROM php:8.3-fpm as php
RUN apt-get upadte && apt-get install -y nginx
COPY . /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD service php8.3-fpm start && nginx -g 'daemon off;'