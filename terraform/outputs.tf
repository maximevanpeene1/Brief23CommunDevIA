# Afficher le nom du groupe de ressources
output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

# Afficher le nom du cluster Kubernetes
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.k8s.name
}

# Afficher le certificat client du cluster
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
  sensitive = true # Marquer cette valeur comme sensible pour éviter qu'elle ne soit affichée dans les logs
}

# Afficher la clé client du cluster
output "client_key" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
  sensitive = true # Marquer cette valeur comme sensible
}

# Afficher le certificat CA du cluster
output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  sensitive = true # Marquer cette valeur comme sensible
}

# Afficher le mot de passe du cluster
output "cluster_password" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].password
  sensitive = true # Marquer cette valeur comme sensible
}

# Afficher le nom d'utilisateur du cluster
output "cluster_username" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].username
  sensitive = true # Marquer cette valeur comme sensible
}

# Afficher l'hôte du cluster
output "host" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].host
  sensitive = true # Marquer cette valeur comme sensible
}

# Afficher la configuration brute de kube du cluster
output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true # Marquer cette valeur comme sensible pour éviter qu'elle ne soit affichée dans les logs
}
