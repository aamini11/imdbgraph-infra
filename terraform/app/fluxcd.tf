variable "github_token" {
  type = string
}

variable "target_path" {
  type = string
}

terraform {
  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.6.1"
    }
  }
}

provider "flux" {
  kubernetes = {
    host                   = azurerm_kubernetes_cluster.this.kube_config[0].host
    username               = azurerm_kubernetes_cluster.this.kube_config[0].username
    password               = azurerm_kubernetes_cluster.this.kube_config[0].password
    client_certificate     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate)
  }
  git = {
    url = "https://github.com/aamini11/imdbgraph-infra.git"
    http = {
      username = "git" # This can be any string when using a personal access token
      password = var.github_token
    }
  }
}

resource "flux_bootstrap_git" "this" {
  path = var.target_path
}