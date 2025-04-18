# 🕹️ Aventure Textuelle en Swift

Bienvenue dans un jeu d’aventure textuel développé en Swift. Incarne un aventurier explorant un donjon rempli d’objets, d’énigmes et de personnages mystérieux à travers 9 salles interconnectées.

---

## 🚀 Comment démarrer le jeu

### 🧱 Prérequis

- ✅ [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- ✅ Git
- ✅ Visual Studio Code
- ✅ Accès à Internet (pour le build Docker)

---

### ⚙️ Étapes de configuration

1. **Cloner le dépôt** :

   ```bash
   git clone https://github.com/yas2-AM/AventureTextuelleSwift.git
   cd AventureTextuelleSwift
   ```

2. **Construire l'image Docker** :

   ```bash
   docker build -t swiftgame .
   ```

3. **Lancer le jeu** :

   ```bash
   docker run -it --rm -v ${PWD}:/app swiftgame
   ```

   🔁 Si `${PWD}` ne fonctionne pas, remplace par le chemin absolu entre guillemets :
   ```bash
   docker run -it --rm -v "C:\Users\PC\Downloads\AventureTextuelleSwift":/app swiftgame
   ```

---

## 🧩 Commandes disponibles

| Commande | Action |
|----------|--------|
| 1 à 4    | Se déplacer (Nord, Sud, Est, Ouest) |
| 5        | Ramasser l’objet présent |
| 6        | Voir l’inventaire |
| 7        | Résoudre l’énigme de la salle |
| 8        | Quitter l’aventure (affiche le score) |
| 9        | Afficher la carte |
| 10       | Parler au personnage présent |
| `aide` ou `?` | Réaffiche les commandes disponibles |

---

## 🧠 Objectif du jeu

- Explorer toutes les salles
- Résoudre des énigmes
- Collecter des objets
- Atteindre la salle du trésor avec les bons objets pour gagner !

---

## 💾 Système de sauvegarde

- Une sauvegarde est créée automatiquement après chaque action.
- Lors du lancement, vous pouvez reprendre la partie précédente.

---

## 🧑‍💻 À propos

- Langage : Swift
- Dépendances : Aucune
- Environnement : Docker (Swift 5.9+)
- Auteur : yas2-AM

---

## 📄 Licence

Ce projet est sous licence MIT.
