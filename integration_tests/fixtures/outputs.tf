output "vault_identity_group_encrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = jsondecode(module.default.vault_identity_group_encrypt)
}

output "vault_identity_group_decrypt" {
  description = "JSON data of the Vault Identity Group, including list of member entities"
  value       = jsondecode(module.default.vault_identity_group_decrypt)
}

output "encrypted_ciphertext" {
  description = "checking the ciphertext value"
  value       = data.vault_transit_encrypt.default.ciphertext
}

output "decrypted_plaintext" {
  description = "Testing to see if the correct value has been decrypted."
  value       = data.vault_transit_decrypt.default.plaintext
}
