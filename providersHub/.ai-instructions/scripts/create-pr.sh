#!/bin/bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

show_help() {
  cat "$(dirname "$0")/create-pr.md"
}

TITLE=""
BODY=""
BASE_BRANCH="main"
DRAFT_FLAG=""
REVIEWER=""
LABEL=""
while [[ $# -gt 0 ]]; do
  case $1 in
  -t | --title)
    TITLE="$2"
    shift 2
    ;;
  -b | --body)
    BODY="$2"
    shift 2
    ;;
  -B | --base)
    BASE_BRANCH="$2"
    shift 2
    ;;
  -d | --draft)
    DRAFT_FLAG="--draft"
    shift
    ;;
  -r | --reviewer)
    REVIEWER="$2"
    shift 2
    ;;
  -l | --label)
    LABEL="$2"
    shift 2
    ;;
  -h | --help)
    show_help
    exit 0
    ;;
  *)
    echo -e "${RED}Option inconnue: $1${NC}"
    show_help
    exit 1
    ;;
  esac
done

if ! command -v gh &>/dev/null; then
  echo -e "${RED}Erreur: GitHub CLI (gh) n'est pas installé${NC}"
  echo "Installation: https://cli.github.com/"
  exit 1
fi

if [ -z "$TITLE" ]; then
  echo -e "${RED}Erreur: Le titre de la PR est requis (-t ou --title)${NC}"
  show_help
  exit 1
fi

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo -e "${RED}Erreur: Pas dans un dépôt git${NC}"
  exit 1
fi

CURRENT_BRANCH=$(git branch --show-current)

if [ "$CURRENT_BRANCH" = "$BASE_BRANCH" ]; then
  echo -e "${YELLOW}Attention: Vous êtes sur la branche $BASE_BRANCH${NC}"
  read -p "Voulez-vous créer une nouvelle branche? (o/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Oo]$ ]]; then
    read -p "Nom de la nouvelle branche: " NEW_BRANCH
    git checkout -b "$NEW_BRANCH"
    CURRENT_BRANCH="$NEW_BRANCH"
  else
    echo -e "${RED}Annulé${NC}"
    exit 1
  fi
fi

echo -e "${GREEN}Création de la PR...${NC}"
echo "Branche: $CURRENT_BRANCH -> $BASE_BRANCH"
echo "Titre: $TITLE"

CMD="gh pr create --title \"$TITLE\" --base \"$BASE_BRANCH\""

if [ -n "$BODY" ]; then
  CMD="$CMD --body \"$BODY\""
fi

if [ -n "$DRAFT_FLAG" ]; then
  CMD="$CMD $DRAFT_FLAG"
fi

if [ -n "$REVIEWER" ]; then
  CMD="$CMD --reviewer \"$REVIEWER\""
fi

if [ -n "$LABEL" ]; then
  CMD="$CMD --label \"$LABEL\""
fi

eval $CMD

if [ $? -eq 0 ]; then
  echo -e "${GREEN}✓ Pull Request créée avec succès!${NC}"
else
  echo -e "${RED}✗ Erreur lors de la création de la PR${NC}"
  exit 1
fi
