# Construisez et testez une infrastructure de données


 ## 👤 Auteur

Projet réalisé par **Noel Emmanuel**  

- 🔗 GitHub : https://github.com/Noel974 
- 💼 LinkedIn : https://www.linkedin.com/in/Antoine-Noel/ 
- 📧 Email : noelantoine974@outlook.fr  

 ## Sommaire 
-[Description](#descritption)
-[Technologie](#technologie)
-[Deroulement](#deroulement)
-[Docker](#docker)
-[Deployment](#depoyment)

## Description 

L'objectif est de fournir quotidiennement des données météorologiques de qualité tous la mission consiste à concevoir, implémenter et industrialiser un pipeline de données de type *ELT* permettant d’ingérer, transformer et fiabiliser ces nouvelles données météorologiques.
## Tehcnologie 
Installer un environnement de travail python 
python -m venv venv
pip install dbt-postgres
venv/bin/activate

## Déroulement 
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
```bash 
docker compose up -d

docker exec -it postgres_local psql -U airbyte -d analytics
```
Pour la partie test 
```bash
\dt

SELECT * FROM _airbyte_raw_meteologie LIMIT 5;

```
### Mise en place DBT
creer l'intermediate puis faire dbt run --select int_meteologie

creer la dimension puis faire dbt run --select dim_weather_stations
 verifier si tous es ok avec la commande dbt test

```bash 
abctl local credentials
```
"# Construisez_et_testez_une_infrastructure_de_donn-es" 
