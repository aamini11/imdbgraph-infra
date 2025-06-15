output "workload_identity_client_id" {
  description = "The client ID of the created managed identity to use for the annotation 'azure.workload.identity/client-id' on your service account"
  value       = module.app.workload_identity_client_id
}

output "db_password" {
  description = "The password for the PostgreSQL server"
  value       = module.app.db_password
  sensitive   = true
}