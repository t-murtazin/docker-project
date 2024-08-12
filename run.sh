#!/bin/bash

# Переменные
NETWORK_NAME=my_network
MYSQL_CONTAINER=mysql_container
MYSQL_ROOT_PASSWORD=rootpassword
MYSQL_DATABASE=testdb
PHP_CONTAINER=php_container
MYSQL_IMAGE=mysql:8.0-bookworm
PHP_IMAGE=my-php-app

# Создаем сеть
docker network create $NETWORK_NAME

# Запускаем MySQL контейнер
docker run -d --name $MYSQL_CONTAINER --network $NETWORK_NAME \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e MYSQL_DATABASE=$MYSQL_DATABASE \
  -v $(pwd)/init.sql:/docker-entrypoint-initdb.d/init.sql \
  $MYSQL_IMAGE

# Ожидаем запуска MySQL
sleep 60

# Запускаем PHP контейнер
docker build -t $PHP_IMAGE .
docker run -d --name $PHP_CONTAINER --network $NETWORK_NAME -p 127.0.0.1:8080:80 $PHP_IMAGE

echo "Приложение запущено. Откройте http://localhost:8080 для просмотра."
