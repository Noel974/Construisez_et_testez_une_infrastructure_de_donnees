# Construisez et testez une infrastructure de données

## Sommaire  


### Installation Airbyte
Airbyte ne supporte plus Docker Compose : l’installation se fait désormais via abctl, l’outil officiel qui déploie Airbyte dans un cluster Kubernetes local (kind) géré automatiquement par Docker.
Commande pour installer airbyte 
```bash 
curl -LsfS https://get.airbyte.com | bash -
```
Instalation en mode local 
```bash
abctl local install
```
récuperation des identifiant et mot passe une fois connecté 
```bash 
abctl local credentials
```
Pour un reprise du projet 
```bash 
abctl local status
``` 
suivi de car airbyte ne posse pas pour l'instant de start ou de stop pour relancer et areter un projet en cours 
```bash 
abctl local install
```
en cas de bug 
```bash 
abctl local uninstall
abctl local install
```
mv ~/.abctl ./airbyte/abctl-config


### Mise en place de Postgresql 
### Mise en place DBT

````bash 
docker exec -it postgres_local psql -U airbyte -d analytics

```
````bash 
abctl local credentials
```
"# Construisez_et_testez_une_infrastructure_de_donn-es" 
