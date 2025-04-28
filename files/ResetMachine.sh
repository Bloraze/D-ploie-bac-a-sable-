#!/bin/bash

echo "🧹 Nettoyage complet de la machine..."

# Supprimer tout ce qui est Kubernetes
sudo kubeadm reset -f || true
sudo systemctl stop kubelet || true
sudo systemctl disable kubelet || true
sudo apt-get purge -y kubeadm kubectl kubelet kubernetes-cni || true
sudo rm -rf ~/.kube /etc/kubernetes /var/lib/etcd /var/lib/kubelet || true

# Supprimer tout ce qui est Docker
sudo systemctl stop docker || true
sudo systemctl disable docker || true
sudo apt-get purge -y docker.io docker-ce docker-ce-cli containerd runc || true
sudo rm -rf /var/lib/docker /etc/docker || true

# Nettoyer les paquets inutiles
sudo apt-get autoremove -y || true
sudo apt-get autoclean -y || true

# Recharger les services
sudo systemctl daemon-reexec || true

echo "✅ Machine nettoyée avec succès ! Redémarrage conseillé."
