# Configuration principale de Terraform
terraform {
  # Spécifier la version requise de Terraform
  required_version = ">=1.0"

  # Spécifier les fournisseurs requis avec leurs versions respectives
  required_providers {
    # Configuration pour le fournisseur 'azapi'
    azapi = {
      source  = "azure/azapi" # Origine du fournisseur
      version = "~>1.5"       # Version requise
    }

    # Configuration pour le fournisseur 'azurerm' d'HashiCorp pour Azure Resource Manager
    azurerm = {
      source  = "hashicorp/azurerm" # Origine du fournisseur
      version = "~>3.0"             # Version requise
    }

    # Configuration pour le fournisseur 'random' d'HashiCorp pour générer des valeurs aléatoires
    random = {
      source  = "hashicorp/random" # Origine du fournisseur
      version = "~>3.0"            # Version requise
    }

    # Configuration pour le fournisseur 'time' d'HashiCorp pour travailler avec le temps
    time = {
      source  = "hashicorp/time" # Origine du fournisseur
      version = "0.9.1"          # Version spécifique requise
    }
  }
}

# Configuration pour le fournisseur 'azurerm'
provider "azurerm" {
  # Les caractéristiques spécifiques au fournisseur, laissées vides dans cet exemple
  features {}
}
