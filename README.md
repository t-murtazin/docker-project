# Docker Web Application

## Описание

Этот проект содержит веб-приложение, использующее PHP и MySQL, развернутое с помощью Docker. Он включает в себя PHP-контейнер и MySQL-контейнер, соединенные через Docker-сеть.

## Структура проекта

- `Dockerfile` - файл для создания образа PHP.
- `index.php` - PHP-скрипт, который подключается к базе данных и отображает данные.
- `init.sql` - SQL-скрипт для инициализации базы данных и добавления тестовых данных.
- `run.sh` - скрипт для автоматического запуска контейнеров и настройки сети.

## Запуск проекта

1. Клонируйте репозиторий:

   `git clone https://github.com/t-murtazin/docker-project.git
   cd docker-project`

3. Сделайте скрипт run.sh исполняемым:

    chmod +x run.sh

4. Запустите скрипт run.sh для развертывания приложения:

    ./run.sh

5. Откройте браузер и перейдите по адресу:

http://localhost:8080


## Остановка и удаление контейнеров

Чтобы остановить и удалить контейнеры и сеть, выполните:

    docker stop mysql_container php_container
    docker rm mysql_container php_container
    docker network rm my_network

