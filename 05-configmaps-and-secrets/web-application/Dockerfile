FROM composer AS composer

COPY composer.* /app/

RUN composer install

FROM php:8.0-apache

RUN a2enmod rewrite

COPY . .

COPY --from=composer /app/vendor/ vendor/
