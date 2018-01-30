# magic-lamp-docker
Docker image for general purpose webdev

_This image is experimental and only aimed for local development, primarly with Laravel._

### Basic Usage

- Install Docker (Windows version instead of Toolbox if possible).
- With Docker for Windows, install may not work if not running as Administrator. Same goes for command-line...
- Put the `docker` folder and `docker-compose.yml` where webroot should be. The file `.dockerignore` is not necessary if not deploying an image.
- Open a command-line
- Run `docker-compose up`
- Http server will be available at localhost:8080 and MySQL database at localhost:3306.

### Util

PHP CLI

- docker-compose exec app php artisan make:controller HomeController
- docker-compose exec app php artisan optimize

Composer

- docker-compose exec app run composer install

NPM

- docker-compose exec app run npm install
- docker-compose exec app run npm run dev

### Configuration

- The image does not use environment or arguments.
- You can change ports and database credentials in the `docker-compose.yml` file.
- If you want to add specific PHP packages or utils, edit the `/docker/app.dockerfile`
- If you want customize nginx web server, edit the `/docker/web.dockerfile` and `/docker/vhost.conf`