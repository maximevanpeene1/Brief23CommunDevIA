variable "resource_group_name" {
  type    = string
  default = "rg-brief23max-envdev"
}

variable "node_count" {
  type        = number
  description = "Quantité initiale de nœuds pour le pool de nœuds."
  default     = 3
}

variable "msi_id" {
  type        = string
  description = "L'ID de l'identité de service géré. Définissez cette valeur si vous exécutez cet exemple en utilisant l'identité de service géré comme méthode d'authentification."
  default     = null
}

variable "username" {
  type        = string
  description = "Le nom d'utilisateur administrateur pour le nouveau cluster."
  default     = "max"
}

variable "cluster_name" {
  type    = string
  default = "aks-brief23max-envdev"
}

variable "storage_account_name" {
  description = "The name of the storage account."
  default     = "storagebrief23maxdev"
}

variable "file_share_name" {
  description = "The name of the Azure File Share."
  default     = "brief23fileshare"
}
