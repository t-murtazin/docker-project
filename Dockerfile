FROM php:8.2-apache

# Устанавливаем расширение mysqli
RUN docker-php-ext-install mysqli

# Копируем PHP-файлы в контейнер
COPY index.php /var/www/html/

# Открываем порт 80 для доступа
EXPOSE 80
