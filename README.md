# Hexagonal Architecture Example Project

This is a repository is intended to perform an example with an hexagonal architectural design for Domain-Driven Design aproach. \
In each step of development it will apply and explain Test-Driven Design practices and SOLID principles too.

The Hexagonal Architecture, or Ports & Adapters architecture, is an architectural pattern used in software design. It aims at creating loosely coupled application components that can be easily connected to their software environment by means of ports and adapters. This divides a system into several loosely-coupled interchangeable components, such as the application core, the database, the user interface, test scripts and interfaces with other systems. This approach is an alternative to the traditional layered architecture. \
According to some authors, the hexagonal architecture is at the origin of the microservices architecture.

# Main Configuration
In the case of Docker for Linux (standard distribution), the IP address of the host will always be 172.17.0.1. But to ensure this, run the following command for continuing `docker-compose.yml` settings.
```
$ docker network inspect bridge -f '{{range .IPAM.Config}}{{.Gateway}}{{end}}'
```

Regarding any service or interface port, they can be modified.

Each service and interface has its own documentation.

# Driven Services

### Service 1
Service 1 is build by NGINX and PHP 8.1 that contains Symfony 6 framework. It automatically install composer and some bundles.
- NGINX 1.21 on port 8880
- PHP 8.1 with Composer 2 on port 9000
- Symfony 6.x is provided as a blank new application, working with Docker support. Some packages have already been installed to help you and spare time :
- Maker Bundle
- ORM (with PostgreSQL integration)
- Xdebug

Start service as follows
```
$ make service1-start
```
Once container is up, run the following commands:
```
$ make service1-api-build
```

### Databases Storage
Both MySQL and MariaDb first configuration must be done by root user to grant permissions and set password for exagon_user and can be executed by container shell or enabling phpMyAdmin. See: `make help` command.
- MySQL on port 4406 *(with phpMyAdmin on port 8891)*
- MariaDB on port 4407 *(with phpMyAdmin on port 8892)*
- PostgreSQL *(on development)*
- Redis *(on development)*
- MongoDB *(on development)*
- ElasticSearch *(on development)*

# Driving Interfaces

### Interface 1
- Vanilla *(on development)*

### Interface 2
- VueJS *(on development)*

### Interface 3
- React *(on development)*

### Interface 4
- Angular *(on development)*