# Ressource pour générer un nom aléatoire pour la clé SSH
resource "random_pet" "ssh_key_name" {
  prefix    = "ssh" # Préfixe du nom
  separator = "-"   # Aucun séparateur entre le préfixe et le nom généré
}

# Action pour générer une paire de clés SSH publique et privée
resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01" # Type et version de l'action
  resource_id = azapi_resource.ssh_public_key.id             # ID de la ressource associée
  action      = "generateKeyPair"                            # Action spécifique pour générer la paire de clés
  method      = "POST"                                       # Méthode HTTP pour l'action

  # Exporter les clés générées pour une utilisation ultérieure
  response_export_values = ["publicKey", "privateKey"]
}

# Ressource pour créer une clé publique SSH dans Azure
resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01" # Type et version de la ressource
  name      = random_pet.ssh_key_name.id                   # Utiliser le nom aléatoire généré précédemment
  location  = data.azurerm_resource_group.rg.location           # Lieu basé sur le groupe de ressources
  parent_id = data.azurerm_resource_group.rg.id                 # ID du groupe de ressources parent
}

# Affichage de la clé publique générée
output "key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
}
