# GitHub Copilot Instructions

Ce fichier contient les instructions spécifiques pour GitHub Copilot CLI.

## 📚 Instructions Core (Agnostic)

Les instructions de base sont définies dans les fichiers agnostic du dossier `/.ai-instructions`. Copilot doit suivre ces guidelines:

### Coding Standards

- **Base**: Voir [coding-base.instructions.md](../.ai-instructions/instructions/coding-base.instructions.md)
- **Frontend**: Voir [coding-front.instructions.md](../.ai-instructions/instructions/coding-front.instructions.md)
- **Backend**: Voir [coding-back.instructions.md](../.ai-instructions/instructions/coding-back.instructions.md)

### Pull Requests

- **Guidelines PR**: Voir [pr-guidelines.instructions.md](../.ai-instructions/instructions/pr-guidelines.instructions.md)

## 🛠️ Scripts & Workarounds

### Création de Pull Request

Quand l'utilisateur demande de créer une PR, utilise le script:

```bash
../.ai-instructions/scripts/create-pr.sh [OPTIONS]
```

**Documentation**: [create-pr.md](../.ai-instructions/scripts/create-pr.md)

**Usage typique**:

```bash
# PR simple
../.ai-instructions/scripts/create-pr.sh -t "feat(api): add user authentication"

# PR en draft avec reviewer
../.ai-instructions/scripts/create-pr.sh -t "fix(ui): button alignment" -d -r username

# PR avec description et label
../.ai-instructions/scripts/create-pr.sh -t "refactor(core): simplify logic" -b "Description détaillée" -l refactor
```

**Prérequis**: GitHub CLI (`gh`) doit être installé et authentifié.

## 📝 Notes pour Copilot

- Toujours référencer les instructions core plutôt que de dupliquer le contenu
- Proposer d'utiliser les scripts disponibles quand approprié
- Suivre les conventions définies dans les fichiers d'instructions agnostic
