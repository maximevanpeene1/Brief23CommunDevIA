# Créer un groupe de ressources avec le nom aléatoire généré
data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

# Générer un nom aléatoire pour le cluster Kubernetes Azure
resource "random_pet" "azurerm_kubernetes_cluster_name" {
  prefix = "cluster"
}

# Générer un préfixe DNS aléatoire pour le cluster Kubernetes Azure
resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}

# Créer un cluster Kubernetes Azure avec les noms aléatoires générés
resource "azurerm_kubernetes_cluster" "k8s" {
  location            = data.azurerm_resource_group.rg.location
  name                = var.cluster_name
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

  # Utiliser l'identité assignée par le système
  identity {
    type = "SystemAssigned"
  }

  # Configuration du pool de nœuds par défaut
  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = var.node_count
  }

  # Profil Linux pour les nœuds
  linux_profile {
    admin_username = var.username

    # Configuration de la clé SSH
    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }

  # Profil réseau pour le cluster
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}
