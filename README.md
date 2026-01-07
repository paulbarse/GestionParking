# Gestion de Parking en Ada (SAE 1.01)

Ce projet est une application de gestion de parking développée en langage **Ada**. Il a été réalisé dans le cadre d'une Situation d'Apprentissage et d'Évaluation (SAE 1.01) de première année universitaire.

Le programme permet de gérer les entrées et sorties de véhicules, de calculer des tarifs de stationnement et d'analyser l'occupation du parking via un menu interactif.

## 📂 Structure du Projet

L'organisation du projet est la suivante :

* **`src/`** : Contient le code source.
    * **`voiture.ads/adb`** : Gestion des informations d'un véhicule (immatriculation, heure d'entrée, place).
    * **`parking.ads/adb`** : Gestion du tableau de stationnement (ajout, suppression, recherche).
    * **`actions_parking.ads/adb`** : Fonctions avancées (calcul de tarif, statistiques sur la durée, lecture fichier).
    * **`menu.adb`** : Le programme principal interactif proposant les différentes options à l'utilisateur.
    * **`main.adb`** : Un programme de test sommaire.
* **`obj/`** : Répertoire contenant les fichiers compilés (généré automatiquement).
* **`actions_parking.gpr`** : Fichier projet GNAT pour la configuration de la compilation.

## 🚀 Fonctionnalités

Le programme principal (`menu`) offre les fonctionnalités suivantes :

1.  **Gestion des Voitures** : Ajout et suppression de voitures (en fin de liste ou à une position précise).
2.  **Recherche** : Trouver si une voiture est présente et à quel emplacement.
3.  **Affichage** : Lister toutes les voitures actuellement garées.
4.  **Statistiques & Tarifs** :
    * Calculer le nombre de places disponibles.
    * Identifier la voiture stationnée depuis le plus longtemps.
    * Calculer le tarif pour une durée donnée.
    * Trouver le numéro de place le plus élevé occupé.
5.  **Chargement** : Remplissage manuel ou lecture depuis un fichier.

## 🛠️ Prérequis

Pour compiler ce projet, vous avez besoin de :
* Un compilateur Ada (ex: **GNAT**).
* L'outil **GPRbuild**.

## 💻 Installation et Compilation

1.  Ouvrez un terminal à la racine du projet (là où se trouve `actions_parking.gpr`).
2.  Compilez le projet avec la commande :

```bash
gprbuild -P actions_parking.gpr