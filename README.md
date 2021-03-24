![inspec-test](https://github.com/devops-adeel/terraform-vault-secrets-transit/actions/workflows/terraform-apply.yml/badge.svg)

# Terraform Vault Transit Backend

This terraform module mounts Vault Transit engine, creates a templated ACL
policy with an Identity Group associated.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name    | Version   |
| ------  | --------- |
| `vault` | n/a       |

## Modules

No Modules.

## Resources

| Name                                                                                                                                   |
| ------                                                                                                                                 |
| [vault_identity_entity](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity)                 |
| [vault_identity_group](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/identity_group)                |
| [vault_identity_group](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group)                   |
| [vault_identity_group_policies](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_policies) |
| [vault_mount](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount)                                     |
| [vault_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy)                                   |
| [vault_policy_document](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document)              |

## Inputs

| Name                 | Description                                                                                   | Type           | Default   | Required   |
| ------               | -------------                                                                                 | ------         | --------- | :--------: |
| `decrypt_entity_ids` | List of Vault Identity IDs to be a member of Vault Identity Group for decrypting Transit keys | `list(string)` | `[]`      | no         |
| `encrypt_entity_ids` | List of Vault Identity IDs to be a member of Vault Identity Group for encrypting Transit keys | `list(string)` | `[]`      | no         |

## Outputs

| Name                           | Description                                                              |
| ------                         | -------------                                                            |
| `backend_path`                 | The path of mounted secret engine                                        |
| `vault_identity_group_decrypt` | JSON data of the Vault Identity Group, including list of member entities |
| `vault_identity_group_encrypt` | JSON data of the Vault Identity Group, including list of member entities |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
