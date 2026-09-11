# Mise en place de l'environnement de développement

## Initialisation de la base de données
Télécharger MySql 8

Créer un utilisateur

Créer une nouvelle base de données nommée `livrai`

Appliquer le script SQL db/init-script.sql

## Lancement du serveur

Télécharger Eclipse (un jdk > 6 est nécessaire)

Importer le projet Maven dans Eclipse.

Télécharger tomcat 8.5 et l'ajouter à la vue Server d'Eclipse.

Ajouter le projet `app` au server.

Modifier le fichier `AbstractDao.java` et ajuster le port, username et password de votre base de données.

Lancer le serveur.

Visiter l'URL localhost:8080/app

## 1ère connexion
Il est nécessaire de créer un utilisateur admin en base:
```
INSERT INTO user (email, name, password, admin) VALUES
  ('<email>', 'Livrai', '<password>', TRUE);

```
