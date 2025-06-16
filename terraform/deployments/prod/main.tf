terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.16.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstateifgo5z83pc"
    container_name       = "tfstate-prod"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

variable "github_token" {
  type = string
}

module "app" {
  source = "../../app"

  location            = "westus"
  resource_group_name = "rg-imdbgraph-prod"
  target_path         = "kubernetes/clusters/prod"
  github_token        = var.github_token
}

output "workload_identity_client_id" {
  description = "The client ID of the created managed identity to use for the annotation 'azure.workload.identity/client-id' on your service account"
  value       = module.app.workload_identity_client_id
}

output "db_password" {
  description = "The password for the PostgreSQL server"
  value       = module.app.db_password
  sensitive   = true
}