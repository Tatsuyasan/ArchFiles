# Guidelines pour les Pull Requests

## Format du titre

Utiliser le format Conventional Commits:

```
<type>(<scope>): <numéro-jira> - <description> <numéro-jira>
```

### Types disponibles

- `feat`: Nouvelle fonctionnalité
- `fix`: Correction de bug
- `docs`: Documentation
- `style`: Formatage, points-virgules manquants, etc.
- `refactor`: Refactoring de code
- `perf`: Amélioration de performance
- `test`: Ajout de tests
- `build`: Changements du système de build
- `ci`: Changements de CI/CD
- `chore`: Maintenance, tâches diverses
- `revert`: Annulation d'un commit précédent

### Exemples

```
feat(front): DBC-1234 - add OAuth2 authentication
fix(back): DBC-1234 - correct null pointer exception in user service
docs(readme): DBC-1234 - update installation instructions
refactor(utils): DBC-1234 - simplify date formatting logic
```

## Description de la PR

### Structure recommandée

```markdown
## Description

[Description claire et concise des changements]

## Motivation et contexte

[Pourquoi ces changements sont nécessaires?]

## Type de changement

- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)
- [ ] Documentation update

## Comment cela a été testé?

[Décrire les tests effectués]
```

## Bonnes pratiques

1. **Taille de la PR**: Garder les PRs petites et focalisées
2. **Commits**: Faire des commits atomiques et descriptifs
3. **Tests**: Toujours ajouter des tests pour les nouvelles fonctionnalités
4. **Documentation**: Mettre à jour la doc si nécessaire
5. **Review**: Faciliter la review en ajoutant des commentaires explicatifs
6. **CI/CD**: S'assurer que tous les checks passent avant de demander une review

## Labels suggérés

- `enhancement`: Nouvelle fonctionnalité
- `bug`: Correction de bug
- `documentation`: Documentation
- `refactor`: Refactoring
- `performance`: Amélioration de performance
- `security`: Correction de sécurité
- `breaking-change`: Changement incompatible
- `needs-review`: En attente de review
- `work-in-progress`: Travail en cours
