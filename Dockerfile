FROM php:8.3.7RC1-fpm-bullseye as php
COPY index.php /var/www/html/
WORKDIR /var/www/html

FROM nginx:stable-alpine as nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
COPY --from=php /var/www/html /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]