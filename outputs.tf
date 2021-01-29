output "vault_identity_group_encrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = data.vault_identity_group.encrypt.data_json
}

output "vault_identity_group_decrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = data.vault_identity_group.decrypt.data_json
}

output "backend_path" {
  description = "The path of mounted secret engine"
  value = vault_mount.default.path
}
