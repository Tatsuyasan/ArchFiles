# create-pr.sh

Script pour créer une Pull Request en utilisant GitHub CLI (gh)

## Usage

```bash
./create-pr.sh [OPTIONS]
```

## Options

| Option | Description |
|--------|-------------|
| `-t, --title TITLE` | Titre de la PR (requis) |
| `-b, --body BODY` | Description de la PR |
| `-B, --base BRANCH` | Branche de base (défaut: main) |
| `-d, --draft` | Créer en mode draft |
| `-r, --reviewer USER` | Ajouter un reviewer |
| `-l, --label LABEL` | Ajouter un label |
| `-h, --help` | Afficher l'aide |

## Exemples

### Création simple d'une PR

```bash
./create-pr.sh -t "Ajout nouvelle fonctionnalité"
```

### PR en mode draft avec description

```bash
./create-pr.sh -t "Fix bug" -b "Correction du bug #123" -d
```

### PR avec branche de base, reviewer et label

```bash
./create-pr.sh -t "Update" -B develop -r username -l bug
```

## Prérequis

- GitHub CLI (`gh`) doit être installé
- Être dans un dépôt git
- Être authentifié avec `gh auth login`

## Installation de GitHub CLI

Si `gh` n'est pas installé, visitez : https://cli.github.com/

## Comportement

1. Le script vérifie que GitHub CLI est installé
2. Vérifie que vous êtes dans un dépôt git
3. Si vous êtes sur la branche de base, propose de créer une nouvelle branche
4. Crée la Pull Request avec les options spécifiées
5. Affiche un message de succès ou d'erreur

## Messages colorés

- 🟢 **Vert** : Succès et informations
- 🟡 **Jaune** : Avertissements
- 🔴 **Rouge** : Erreurs
