# Application Photo Mood

Cette application permet aux utilisateurs de partager leurs photos accompagnées d'un commentaire lié à leur humeur. Les photos peuvent être sélectionnées depuis la galerie de l'appareil ou ajoutées directement dans l'application.

## Fonctionnalités

- **Affichage des photos** : Les photos sont affichées dans un carrousel, permettant à l'utilisateur de naviguer facilement entre les différentes images.
- **Commentaires** : Les utilisateurs peuvent laisser des commentaires sur les photos, avec une interface simple pour saisir du texte.
- **Sélection de photos** : Les utilisateurs peuvent sélectionner une photo via un bouton dédié, qui ouvre un sélecteur d'images (`PhotosPicker`).
- **Moods** : Chaque photo peut être associée à une humeur ("joyeux" ou "calme"), avec la possibilité de définir l'humeur lors de l'ajout de la photo.

## Architecture

L'application suit une **architecture propre (Clean Architecture)**. Les principales couches de l'architecture sont :

- **ViewModel** : La logique de présentation est gérée par des objets `ViewModel`, qui interagissent avec les cas d'utilisation.
- **Use Cases** : Les cas d'utilisation traitent la logique métier et communiquent avec les services externes (comme les API ou la base de données).
- **Model** : Les modèles de données représentent les entités qui sont manipulées dans l'application (par exemple, `MoodModel`).

Les données sont récupérées via un service `GetFeedUseCase`, qui se charge de récupérer les informations à afficher et de les transformer en objets que l'application peut utiliser.

## Technologies utilisées

- **SwiftUI** : Framework principal pour l'interface utilisateur.
- **Combine** : Utilisé pour la gestion de l'état réactif et des mises à jour de l'interface.
- **PhotosPicker** : Permet aux utilisateurs de sélectionner des photos depuis leur galerie.
- **Clean Architecture** : Structure de l'application suivant les principes de l'architecture propre.

## Installation

1. Clonez ce dépôt sur votre machine locale.
2. Ouvrez le projet dans Xcode.
3. Exécutez l'application sur un simulateur ou un appareil réel.

## Simulateur utilisé

L'application a été testée sur le simulateur **iPhone 16 Pro Max** pour s'assurer que l'interface est correctement adaptée aux écrans de grande taille.

## Contribution

L'application a été développée comme test technique pour **BeReal/Voodoo**.
