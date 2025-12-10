# Standards de Codage

## Principes généraux

### 1. Lisibilité avant tout

- Code auto-documenté
- Noms explicites pour variables, fonctions, classes
- Structure cohérente et prévisible

### 2. Maintenabilité

- Fonctions courtes (< 50 lignes idéalement)
- Une seule responsabilité par fonction/classe
- Éviter la duplication de code
- Utiliser du javascript moderne (ES6+)

### 3. Robustesse

- Gestion appropriée des erreurs
- Validation des entrées
- Tests unitaires

## Conventions de nommage

### Variables et fonctions

```javascript
// ✓ Bon
const userAge = 25;
const isActive = true;
function calculateTotalPrice() {}

// ✗ Mauvais
const x = 25;
const flag = true;
function calc() {}
```

### Classes et constructeurs

```javascript
// ✓ Bon
class UserService {}
class PaymentProcessor {}

// ✗ Mauvais
class userservice {}
class payment_processor {}
```

### Constantes

```javascript
// ✓ Bon
const MAX_RETRY_COUNT = 3;
const API_BASE_URL = "https://api.example.com";

// ✗ Mauvais
const maxRetryCount = 3;
const apiBaseUrl = "https://api.example.com";
```

## Structure du code

### Organisation des fichiers

```text
src/
├── components/     # Composants réutilisables
├── services/       # Logique métier
├── utils/          # Fonctions utilitaires
├── models/         # Modèles de données
├── config/         # Configuration
└── tests/          # Tests
```

### Ordre dans un fichier

1. Imports
2. Constantes
3. Types/Interfaces
4. Fonctions utilitaires privées
5. Classe/Fonction principale
6. Exports

## Commentaires

### Quand commenter

- Logique métier complexe
- Workarounds ou solutions non-évidentes
- TODOs et FIXMEs

### Quand NE PAS commenter

- Code évident
- Répétition du code en langage naturel
- Code commenté (supprimer à la place)

```javascript
// ✗ Mauvais - commentaire inutile
// Incrémente i de 1
i++;

// ✓ Bon - explique le "pourquoi"
// On skip les utilisateurs inactifs pour éviter les emails bounce
if (!user.isActive) continue;
```

## Gestion des erreurs

```javascript
// ✓ Bon
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  logger.error("Operation failed", { error, context });
  throw new ApplicationError("Failed to process request", error);
}

// ✗ Mauvais
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  console.log(error);
  return null;
}
```

## Tests

### Règles

1. Un test = un cas d'usage
2. Noms de tests descriptifs
3. AAA pattern: Arrange, Act, Assert
4. Tests isolés et indépendants

```javascript
// ✓ Bon
describe("UserService", () => {
  describe("createUser", () => {
    it("should create user with valid data", async () => {
      // Arrange
      const userData = { name: "John", email: "john@example.com" };

      // Act
      const user = await userService.createUser(userData);

      // Assert
      expect(user).toBeDefined();
      expect(user.name).toBe("John");
    });

    it("should throw error when email is invalid", async () => {
      // Arrange
      const userData = { name: "John", email: "invalid" };

      // Act & Assert
      await expect(userService.createUser(userData)).rejects.toThrow(
        "Invalid email",
      );
    });
  });
});
```

## Performance

### À faire

- Lazy loading quand approprié
- Mémoïsation des calculs coûteux
- Pagination pour les grandes listes
- Indexes sur les requêtes DB fréquentes

### À éviter

- Boucles dans les boucles (O(n²))
- Requêtes DB dans les boucles
- Re-calculs inutiles
- Chargement de données non utilisées
- Les "magic numbers" et "magic strings"
- Les problèmes de scope avec `var` ou `let`
- Les conditions évidentes comme `isActive === true` (faire plutot `if (isActive)`)

## Sécurité

### Checklist

- [ ] Validation des entrées utilisateur
- [ ] Échappement des sorties
- [ ] Protection contre les injections SQL
- [ ] Protection contre XSS
- [ ] Gestion sécurisée des secrets
- [ ] HTTPS uniquement
- [ ] Rate limiting sur les APIs
- [ ] Logs sans données sensibles
