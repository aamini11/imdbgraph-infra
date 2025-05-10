module "app" {
  source = "../../app"

  location            = "eastus"
  resource_group_name = "rg-imdbgraph-staging"
}