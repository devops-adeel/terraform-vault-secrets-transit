![inspec-test](https://github.com/devops-adeel/terraform-vault-secrets-transit/actions/workflows/terraform-apply.yml/badge.svg)

# Terraform Vault Transit Backend

This terraform module mounts Vault Transit engine, creates a templated ACL
policy with an Identity Group associated.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Usage:

```hcl

module "vault_transit" {
  source      = "git::https://github.com/devops-adeel/terraform-vault-secrets-transit.git?ref=v0.4.0"
  entity_ids = [module.vault_approle.entity_id]
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_entity.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity) | resource |
| [vault_identity_group.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_policies.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_policies) | resource |
| [vault_identity_group_policies.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_policies) | resource |
| [vault_mount.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_identity_group.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/identity_group) | data source |
| [vault_identity_group.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/identity_group) | data source |
| [vault_policy_document.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_decrypt_entity_ids"></a> [decrypt\_entity\_ids](#input\_decrypt\_entity\_ids) | List of Vault Identity IDs to be a member of Vault Identity Group for decrypting Transit keys | `list(string)` | `[]` | no |
| <a name="input_encrypt_entity_ids"></a> [encrypt\_entity\_ids](#input\_encrypt\_entity\_ids) | List of Vault Identity IDs to be a member of Vault Identity Group for encrypting Transit keys | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_path"></a> [backend\_path](#output\_backend\_path) | The path of mounted secret engine |
| <a name="output_vault_identity_group_decrypt"></a> [vault\_identity\_group\_decrypt](#output\_vault\_identity\_group\_decrypt) | JSON data of the Vault Identity Group, including list of member entities |
| <a name="output_vault_identity_group_encrypt"></a> [vault\_identity\_group\_encrypt](#output\_vault\_identity\_group\_encrypt) | JSON data of the Vault Identity Group, including list of member entities |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
