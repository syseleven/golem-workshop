FROM composer AS composer

COPY composer.* /app/

RUN composer install

FROM php:8.0-apache

RUN a2enmod rewrite

RUN docker-php-ext-install mysqli

COPY . .

COPY --from=composer /app/vendor/ vendor/
