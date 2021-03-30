/**
 * Usage:
 *
 * ```hcl
 *
 * module "vault_transit" {
 *   source      = "git::https://github.com/devops-adeel/terraform-vault-secrets-transit.git?ref=v0.4.0"
 * }
 * ```
 */


resource "vault_mount" "default" {
  path        = "transit"
  type        = "transit"
  description = "Vault Secret mount for Transit engine"
}

data "vault_policy_document" "encrypt" {
  rule {
    path         = "transit/encrypt/{{identity.entity.metadata.env}}-{{identity.entity.metadata.service}}"
    capabilities = ["update"]
    description  = "Allow the use of encryption action with the transit key"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
}

data "vault_policy_document" "decrypt" {
  rule {
    path         = "transit/decrypt/{{identity.entity.metadata.env}}-{{identity.entity.metadata.service}}"
    capabilities = ["update"]
    description  = "Allow the use of decryption action with the transit key"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
}

resource "vault_policy" "encrypt" {
  name   = "transit-encrypt-tmpl"
  policy = data.vault_policy_document.encrypt.hcl
}

resource "vault_policy" "decrypt" {
  name   = "transit-decrypt-tmpl"
  policy = data.vault_policy_document.decrypt.hcl
}

resource "vault_identity_group" "encrypt" {
  name                       = "transit-encrypt"
  type                       = "internal"
  external_policies          = true
  external_member_entity_ids = true
}

resource "vault_identity_group" "decrypt" {
  name                       = "transit-decrypt"
  type                       = "internal"
  external_policies          = true
  external_member_entity_ids = true
}

resource "vault_identity_group_policies" "encrypt" {
  group_id  = vault_identity_group.encrypt.id
  exclusive = true
  policies = [
    "default",
    vault_policy.encrypt.name,
  ]
}

resource "vault_identity_group_policies" "decrypt" {
  group_id  = vault_identity_group.decrypt.id
  exclusive = true
  policies = [
    "default",
    vault_policy.decrypt.name,
  ]
}
