# Öber

Bienvenue sur l'application de gestion des commandes Öber, spécilisé dans la restauration rapide Turque. 
## Membres du groupes
- ROME Mathis
- SCHULER Kenza
- LIMANI Getoar
- SOMVEILLE Quentin

## Liens des microservices
Voici les liens utiles:
- [Gateway](https://github.com/mathisrome/m2-microservices-gateway)
- [Customer](https://github.com/mathisrome/m2-microservices-customer)
- [Kitchen](https://github.com/mathisrome/m2-microservices-kitchen)
- [Delivery](https://github.com/mathisrome/m2-microservices-delivery)
- [Order](https://github.com/mathisrome/m2-microservices-order)

## Lien du diaporama
- [Diaporama](https://docs.google.com/presentation/d/1L-1DR8S4r9CzKFjg4t4RdKLst96BJZVG1nGrd5Z9TUI/edit?usp=sharing)

## Initialiser l'application

Cloner les dépendances en ssh, si vous utiliser https, vous pouvez ignorer cette commande:
```shell
make clone
```

Cloner les dépendances en https:
```shell
make clone-http
```

Une fois les dépdances récupérées, vous pouvez démarrer le build:
```shell
make build
```

Cette commande va effectuer ces actions:
- Construire les images Docker
- Démarrer l'envrionnement docker-compose
- Installer les dépendances
- Créer les bases de données
- Effectuer les migrations
- Charger les données de tests

Il faut ensuite démarrer les consumer pour que chaque micro service puisse récupérer les messages depuis le service RabbitMQ. 
Il est nécessaire de les démarrer manuellement:
- Depuis le container du microservice Kitchen:
```shell
php bin/console messenger:consume kitchen_users kitchen_orders -vv
```
- Depuis le container du microservice Order:
```shell
php bin/console messenger:consume order_users order_plates delivery_update_order_status_order -vv
```
- Depuis le container du mciroservice Delivery:
```shell
php bin/console messenger:consume delivery_orders delivery_order_status delivery_users -vv
```
## Connexion
Vous pouvez désormais vous rendre sur l'application via [localhost](localhost:5173) et utiliser le compte suivant:
- username: mathis.rome@icloud.com
- password: mathis
