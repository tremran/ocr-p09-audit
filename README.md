# Mise en place de l'environnement de développement

## Scripts SQL disponibles

Les scripts SQL du projet sont dans le dossier `db/` :

- `db/init-script.sql` : création du schéma de la base de données
- `db/seed-data.sql` : données d'initialisation (utilisateurs, clients, livraisons, factures)

## Initialisation de la base de données avec PostgreSQL

1. Installer PostgreSQL.
2. Créer un utilisateur si nécessaire.
3. Créer une base de données nommée `livrai`.
4. Se connecter à la base `livrai`.
5. Exécuter les scripts dans l'ordre suivant :

```bash
psql -U <username> -d livrai -f db/init-script.sql
psql -U <username> -d livrai -f db/seed-data.sql
```

Si vous souhaitez créer la base et l'utilisateur directement depuis la ligne de commande :

```bash
psql -U postgres
CREATE USER livrai_user WITH PASSWORD 'votre_mot_de_passe';
CREATE DATABASE livrai OWNER livrai_user;
```

Ensuite, reconnectez-vous à la base `livrai` avec l'utilisateur `livrai_user` et appliquez les scripts.

## Configuration de l'application

Le projet Java se connecte à la base de données via le fichier `AbstractDao.java`.
Il faut y configurer :

- le driver PostgreSQL,
- le port PostgreSQL,
- le nom de la base,
- le nom d'utilisateur,
- le mot de passe.

Exemple de configuration attendue :

```java
String url = "jdbc:postgresql://localhost:5432/livrai";
String user = "livrai_user";
String password = "votre_mot_de_passe";
```

## Lancement du serveur

1. Télécharger Eclipse ou un IDE Java compatible.
2. Ouvrir le projet Maven `app`.
3. Télécharger Tomcat 8.5 et l'ajouter dans l'environnement du serveur.
4. Ajouter le projet `app` au serveur.
5. Vérifier la configuration de la base dans `AbstractDao.java`.
6. Lancer le serveur.
7. Ouvrir l'URL : `http://localhost:8080/app`

## 1ère connexion

Les scripts de données initiales créent déjà des comptes de test. Vous pouvez ensuite vous connecter avec les comptes suivants si vous avez utilisé `db/seed-data.sql` :

- `admin@livrai.fr`
- `commercial@livrai.fr`
- `livraison@livrai.fr`
- `client1@livrai.fr`
- `client2@livrai.fr`

Le mot de passe est stocké sous forme hachée dans la base. Pour un environnement de développement local, il est conseillé de réinitialiser les utilisateurs avec des mots de passe de test connus selon votre besoin.

