MAKEFLAGS += --silent

help: ## Show this help message
	echo 'usage: make [target]'
	echo
	echo 'targets:'
	egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

ps:
	docker ps

## MySQL DATABASE
mysql-start: ## Build / Start MySQL container
	cd ./etc/mysql; docker-compose up -d

mysql-stop: ## Stop MySQL container
	docker stop exagon-mysql

mysql-remove: ## Remove MySQL container
	docker rm exagon-mysql

include etc/mysql/.env
mysql-ssh-root: ## Enter into MySQL container as root - remember to change password here if it changes on /etc/mariadb/.env
	docker exec -it exagon-mysql mysql --user root -p${MYSQL_ROOT_PASSWORD};

mysql-ssh: ## Enter into MySQL container - remember to change password here if it changes on /etc/mariadb/.env
	docker exec -it exagon-mysql mysql --user ${MYSQL_USER} -p${An0thrS3crt};

mysql-admin-start: ## Build / Start phpMyAdmin for MySQL container
	cd ./etc/mysql/phpmyadmin; docker-compose up -d

mysql-admin-stop: ## Stop phpMyAdmin for MySQL container
	docker stop exagon-mysql-admin

mysql-admin-remove: ## Remove phpMyAdmin for MySQL container
	docker rm exagon-mysql-admin

## MariaDB DATABASE
mariadb-start: ## Build / Start MariaDB container
	cd ./etc/mariadb; docker-compose up -d

mariadb-stop: ## Stop MariaDB container
	docker stop exagon-mariadb

mariadb-remove: ## Remove MariaDb container
	docker rm exagon-mariadb

include etc/mariadb/.env
mariadb-ssh-root: ## Enter into MariaDb container as root - remember to change password here if it changes on /etc/mariadb/.env
	docker exec -it exagon-mariadb mariadb --user root -p${MYSQL_ROOT_PASSWORD};

mariadb-ssh: ## Enter into MariaDb container - remember to change password here if it changes on /etc/mariadb/.env
	docker exec -it exagon-mariadb mariadb --user ${MYSQL_USER} -p${An0thrS3crt};

mariadb-admin-start: ## Build / Start phpMyAdmin for MariaDB container
	cd ./etc/mariadb/phpmyadmin; docker-compose up -d

mariadb-admin-stop: ## Stop phpMyAdmin for MariaDB container
	docker stop exagon-mariadb-admin

mariadb-admin-remove: ## Remove phpMyAdmin for MariaDB container
	docker rm exagon-mariadb-admin

## Symfony SERVER as Service1
service1-start: ## Build / Start Nginx & PHP containers for Service 1
	cd ./etc/service1; docker-compose up -d

service1-stop: ## Stop Nginx & PHP containers for Service 1
	docker stop exagon-service1

service1-remove: ## Remove Nginx & PHP containers for Service 1
	docker rm exagon-service1

service1-build: ## Build Symfony API for Service 1 just once
	cd ./etc/service1; docker-compose exec exagon-service1-api composer install