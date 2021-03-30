output "backend_path" {
  description = "The path of mounted secret engine"
  value       = vault_mount.default.path
}

output "encrypt_identity_group_id" {
  description = "ID of the created Vault Identity Group."
  value       = vault_identity_group.encrypt.id
  sensitive   = true
}

output "decrypt_identity_group_id" {
  description = "ID of the created Vault Identity Group."
  value       = vault_identity_group.decrypt.id
  sensitive   = true
}
