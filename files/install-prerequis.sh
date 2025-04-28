#!/bin/bash

echo "========================================="
echo " Vérification et installation des prérequis"
echo "========================================="

# Couleurs
GREEN="\e[32m"
RED="\e[31m"
NC="\e[0m" # No Color

# Fonction de vérification
check_and_install() {
  local cmd=$1
  local pkg=$2

  if ! command -v $cmd &> /dev/null; then
    echo -e "${RED}$cmd n'est pas installé. Installation de $pkg...${NC}"
    sudo apt update
    sudo apt install -y $pkg
  else
    echo -e "${GREEN}$cmd est déjà installé.${NC}"
  fi
}

# Docker
check_and_install docker docker.io

# kubectl via snap
if ! command -v kubectl &> /dev/null; then
  echo -e "${RED}kubectl n'est pas installé. Installation via snap...${NC}"
  sudo snap install kubectl --classic
else
  echo -e "${GREEN}kubectl est déjà installé.${NC}"
fi




