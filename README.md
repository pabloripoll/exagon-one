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

## Cli Console
Each layer has its own Makefile.

### Service 1 with Symfony
Service 1 is an API built with NGINX 1.21 and PHP-FPM 8.1 for Symfony 6 framework.
- NGINX port: 8880
- PHP port: 9000

Symfony 6.x is provided as a blank new application, working with Docker support and automatically install composer with initial required bundles installed:
- Maker Bundle
- ORM (with PostgreSQL integration)
- RabbitMQ
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
- MySQL port: 4406 *(with phpMyAdmin on port 8891)*
- MariaDB port: 4407 *(with phpMyAdmin on port 8892)*
- PostgreSQL port: 4408 *(on development)*
- MongoDB port: 4410 *(on development)*
- Redis port: 4411: *(on development)*
- ElasticSearch port: 4412 *(on development)*

# Driving Interfaces

### Interface 1
- Vanilla *(on development)*

### Interface 2
- VueJS *(on development)*

### Interface 3
- React *(on development)*

### Interface 4
- Angular *(on development)*