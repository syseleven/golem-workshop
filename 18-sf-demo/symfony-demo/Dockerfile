# Install frontend dependencies and build JS and CSS
FROM node:12-alpine AS yarn

WORKDIR /var/www/html

COPY package.json /var/www/html/
COPY yarn.lock /var/www/html/

RUN yarn install

COPY webpack.config.js /var/www/html/
COPY assets /var/www/html/assets/

RUN mkdir -p /var/www/html/public/build && yarn run build

# Install PHP dependencies
FROM composer:1.9.0 AS composer

WORKDIR /var/www/html

COPY composer.* /var/www/html/
COPY symfony.lock /var/www/html/

RUN composer install

# Build nginx image
FROM nginx:1.17 AS nginx

COPY public /var/www/html/public/
COPY --from=yarn /var/www/html/public/build/ /var/www/html/public/build/

# Build fpm image
FROM php:7.3-fpm AS fpm

# copy needed files from build containers
COPY --from=yarn /var/www/html/public/build/ /var/www/html/public/build/
COPY --from=composer /var/www/html/vendor/ /var/www/html/vendor/

COPY . /var/www/html/

RUN mkdir -p /var/www/html/var && chown -R www-data:www-data /var/www/html/var
