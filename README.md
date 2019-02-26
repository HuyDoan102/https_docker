# Sales POS Docker Setting

## Prequisites

- Docker. Visit [installation guide](https://www.docker.com/community-edition)
- Docker Compose. Visit [installation guide](https://docs.docker.com/compose/install/)


## Preparation

- Add file rootCA.pem to google chorme and add domain virtual host

```
Add file rootCA.pem to google chorme:
+ Link reference: https://viblo.asia/p/tao-ssl-certificate-authority-cho-https-tren-local-1VgZvpQY5Aw#_google-chrome-2
Add domain(httpsdemo.com) local into file hosts
+ cd /etc/hosts
+ add line: 127.0.0.1   httpsdemo.com
```
- Make sure cloning 2 repositories into the same directory
```
... mkdir https
... cd https
... git clone https://github.com/HuyDoan102/https_docker.git
... git clone https://github.com/HuyDoan102/https.git
Project include:
... https/
... https_docker/
```


## Builder Docker Images Steps:
### 1. Move to project https_docker
```
$ cd https_docker
```
### 2. Create .env file by copying .env.example

```
$ cp .env.example .env
```

### 3.  Build docker containers

```
$ docker-compose build --no-cache
```

### 4. Run docker containers

```
$ docker-compose up -d
```

> -d: detach mode

### 5. Access to web container as "https" user

```
$ docker-compose exec --user=https web bash
```

### 6. Command to implement project

```
$ cd https
$ cp .env.example .env
$ composer install
$ php artisan key:generate
$ php artisan make:auth
$ php artisan migrate
$ php artisan db:seed --class=StoreTableSeeder
```

### 7. Access to web to check
```
Access browse link: httpsdemo.com:8000
>>> auto redirect https://httpsdemo.com
```
