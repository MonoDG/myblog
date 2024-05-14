FROM php:8.3-fpm
RUN apt-get update && apt-get install -y nginx
COPY index.php /var/www/html
COPY myblog.conf /etc/nginx/conf.d/myblog.conf
EXPOSE 80
CMD php-fpm -D && nginx -g 'daemon off;'