variable "encrypt_entity_ids" {
  description = "List of Vault Identity IDs to be a member of Vault Identity Group for encrypting Transit keys"
  type        = list(any)
  default     = []
}

variable "decrypt_entity_ids" {
  description = "List of Vault Identity IDs to be a member of Vault Identity Group for decrypting Transit keys"
  type        = list(any)
  default     = []
}
