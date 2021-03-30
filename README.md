![inspec-test](https://github.com/devops-adeel/terraform-vault-secrets-transit/actions/workflows/terraform-apply.yml/badge.svg)

# Terraform Vault Transit Backend

This terraform module mounts Vault Transit engine, creates a templated ACL
policy with an Identity Group associated.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Usage:

```hcl

module "vault_transit" {
  source      = "git::https://github.com/devops-adeel/terraform-vault-secrets-transit.git?ref=v0.4.0"
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
| [vault_identity_group.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_policies.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_policies) | resource |
| [vault_identity_group_policies.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_policies) | resource |
| [vault_mount.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.decrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.encrypt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_path"></a> [backend\_path](#output\_backend\_path) | The path of mounted secret engine |
| <a name="output_decrypt_identity_group_id"></a> [decrypt\_identity\_group\_id](#output\_decrypt\_identity\_group\_id) | ID of the created Vault Identity Group. |
| <a name="output_encrypt_identity_group_id"></a> [encrypt\_identity\_group\_id](#output\_encrypt\_identity\_group\_id) | ID of the created Vault Identity Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
