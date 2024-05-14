FROM php:8.3-fpm
RUN apt-get update && apt-get install -y nginx
COPY index.php /var/www/html
COPY myblog /etc/nginx/sites-available/myblog
RUN ln -s /etc/nginx/sites-available/myblog /etc/nginx/sites-enabled/myblog
RUN unlink /etc/nginx/sites-enabled/default
EXPOSE 80
CMD php-fpm -D && nginx -g 'daemon off;'