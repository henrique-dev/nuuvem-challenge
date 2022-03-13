## Hera
This project is a rails/postgresql template for generating services for the main application

### Requirements to run:
- docker
- docker-composer

### How to run:
First, you need to setup the project with name and port for the services:
```
$ /bin/bash setup.sh name_of_service port_to_run
```
> Example: /bin/bash setup.sh hercules 3000

After just enter with the following command
```
$ docker-compose build
$ docker-compose run name_of_service rails db:create
$ docker-compose up
```
