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

build:
	clear
	@echo "Construction de l'application Öber IT"
	docker compose build --no-cache

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

