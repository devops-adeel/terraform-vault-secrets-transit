# Terraform Vault Transit Backend

This terraform module mounts Vault Transit engine, creates a templated ACL policy with an Identity Group associated.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| `vault` | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `decrypt_entity_ids` | List of Vault Identity IDs to be a member of Vault Identity Group for decrypting Transit keys | `list(any)` | `[]` | no |
| `encrypt_entity_ids` | List of Vault Identity IDs to be a member of Vault Identity Group for encrypting Transit keys | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| `backend_path` | The path of mounted secret engine |
| `vault_identity_group_decrypt` | JSON data of the Vault Identity Group, including list of member entities |
| `vault_identity_group_encrypt` | JSON data of the Vault Identity Group, including list of member entities |
