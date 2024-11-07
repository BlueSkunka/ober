clone:
	clear
	@echo "Cloning microservices into Öber IT"
	git clone git@github.com:mathisrome/m2-microservices-gateway.git
	git clone git@github.com:mathisrome/m2-microservices-customer.git
	git clone git@github.com:mathisrome/m2-microservices-kitchen.git
	git clone git@github.com:mathisrome/m2-microservices-delivery.git
	git clone git@github.com:mathisrome/m2-microservices-order.git
	git clone git@github.com:mathisrome/m2-microservices-front.git

clone-http:
	clear
	@echo "Cloning microservices into Öber IT"
	git clone https://github.com/mathisrome/m2-microservices-gateway
	git clone https://github.com/mathisrome/m2-microservices-customer
	git clone https://github.com/mathisrome/m2-microservices-kitchen
	git clone https://github.com/mathisrome/m2-microservices-delivery
	git clone https://github.com/mathisrome/m2-microservices-order
	git clone https://github.com/mathisrome/m2-microservices-front

pull:
	clear
	@echo "Updating sources"
	cd m2-microservices-gateway && git pull
	cd m2-microservices-customer && git pull
	cd m2-microservices-kitchen && git pull
	cd m2-microservices-delivery && git pull
	cd m2-microservices-order && git pull
	cd m2-microservices-front && git pull

pull-gateway:
	cd m2-microservices-gateway && git pull

pull-customer:
	cd m2-microservices-customer && git pull

pull-kitchen:
	cd m2-microservices-kitchen && git pull

pull-delivery:
	cd m2-microservices-delivery && git pull

pull-order:
	cd m2-microservices-order && git pull

pull-front:
	cd m2-microservices-front && git pull

composer-install:
	@echo "Installation des dépendances"
	docker compose exec gateway-symfony-php composer install
	docker compose exec customer-symfony-php composer install
	docker compose exec delivery-symfony-php composer install
	docker compose exec kitchen-symfony-php composer install
	docker compose exec order-symfony-php composer install

doctrine-database-create:
	@echo "Création des bases de données"
	docker compose exec gateway-symfony-php php bin/console d:d:c --if-not-exists
	docker compose exec customer-symfony-php php bin/console d:d:c --if-not-exists
	docker compose exec delivery-symfony-php php bin/console d:d:c --if-not-exists
	docker compose exec kitchen-symfony-php php bin/console d:d:c --if-not-exists
	docker compose exec order-symfony-php php bin/console d:d:c --if-not-exists

doctrine-migration-migrate:
	@echo "Exécution des migrations"
	docker compose exec gateway-symfony-php php bin/console d:m:m --no-interaction
	docker compose exec customer-symfony-php php bin/console d:m:m --no-interaction
	docker compose exec delivery-symfony-php php bin/console d:m:m --no-interaction
	docker compose exec kitchen-symfony-php php bin/console d:m:m --no-interaction
	docker compose exec order-symfony-php php bin/console d:m:m --no-interaction

doctrine-fixtures-load:
	docker compose exec gateway-symfony-php php bin/console d:f:l --no-interaction
	docker compose exec customer-symfony-php php bin/console d:f:l --no-interaction
	docker compose exec kitchen-symfony-php php bin/console d:f:l --no-interaction

build:
	clear
	@echo "Construction de l'application Öber IT"
	docker compose build
	@echo "Démarrage de l'environnement Öber"
	docker compose up -d
	$(MAKE) composer-install
	docker compose exec vite npm install
	$(MAKE) doctrine-database-create
	$(MAKE) doctrine-migration-migrate
	$(MAKE) doctrine-fixtures-load

build-no-cache:
	clear
	@echo "Construction de l'application Öber IT"
	docker compose build --no-cache
	@echo "Démarrage de l'environnement Öber"
	docker compose up -d
	$(MAKE) composer-install
	docker compose exec vite npm install
	$(MAKE) doctrine-database-create
	$(MAKE) doctrine-migration-migrate
	$(MAKE) doctrine-fixtures-load
up:
	clear
	@echo "Démarrage de l'application Öber IT en développement"
	docker compose up -d

down:
	clear
	@echo "Arrêt de l'application Öber"
	docker compose down

clean:
	rm -rf m2-microservices-customer
	rm -rf m2-microservices-delivery
	rm -rf m2-microservices-gateway
	rm -rf m2-microservices-kitchen
	rm -rf m2-microservices-order
	rm -rf m2-microservices-front

