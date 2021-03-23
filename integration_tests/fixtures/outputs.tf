output "vault_identity_group_encrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = jsondecode(module.default.vault_identity_group_encrypt)
}

output "vault_identity_group_decrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = jsondecode(module.default.vault_identity_group_decrypt)
}

output "token" {
  description = "Vault Client Token taken from approle"
  value       = vault_approle_auth_backend_login.default.client_token
}

output "url" {
  description = "Vault address where this module is tested against"
  value       = var.vault_address
}

output "namespace" {
  description = "Vault Namespace where integration tests will take place"
  value       = "admin/terraform-vault-secrets-transit/"
}

output "encryption_endpoint" {
  description = "The vault endpoint to encrypt data with key"
  value       = format("transit/encrypt/%s-%s", local.env, local.service)
}

output "decryption_endpoint" {
  description = "The vault endpoint to decrypt data with key"
  value       = format("transit/decrypt/%s-%s", local.env, local.service)
}

output "encoded_data" {
  description = "Base64 encoded test data to encrypt"
  value       = base64encode("integration tests")
}

output "ciphertext" {
  description = "The encrypted ciphertext to decrypt"
  value       = data.vault_transit_encrypt.default.ciphertext
}
