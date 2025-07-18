output "workload_identity_client_id" {
  description = "The client ID of the created managed identity to use for the annotation 'azure.workload.identity/client-id' on your service account"
  value       = azurerm_user_assigned_identity.workload_id.client_id
}

output "db_password" {
  description = "The password for the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.default.administrator_password
  sensitive   = true
}