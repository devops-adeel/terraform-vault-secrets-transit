## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_default"></a> [default](#module\_default) | ./module |  |
| <a name="module_vault_approle_decrypt"></a> [vault\_approle\_decrypt](#module\_vault\_approle\_decrypt) | git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.7.0 |  |
| <a name="module_vault_approle_encrypt"></a> [vault\_approle\_encrypt](#module\_vault\_approle\_encrypt) | git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.7.0 |  |

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_login.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_login) | resource |
| [vault_transit_secret_backend_key.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/transit_secret_backend_key) | resource |
| [vault_auth_backend.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/auth_backend) | data source |
| [vault_transit_encrypt.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/transit_encrypt) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_approle_id"></a> [approle\_id](#input\_approle\_id) | n/a | `any` | n/a | yes |
| <a name="input_approle_secret"></a> [approle\_secret](#input\_approle\_secret) | n/a | `any` | n/a | yes |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault Address | `string` | `"https://vault-cluster.vault.11eb33aa-fa85-0956-a769-0242ac11000f.aws.hashicorp.cloud:8200"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ciphertext"></a> [ciphertext](#output\_ciphertext) | The encrypted ciphertext to decrypt |
| <a name="output_decryption_endpoint"></a> [decryption\_endpoint](#output\_decryption\_endpoint) | The vault endpoint to decrypt data with key |
| <a name="output_encoded_data"></a> [encoded\_data](#output\_encoded\_data) | Base64 encoded test data to encrypt |
| <a name="output_encryption_endpoint"></a> [encryption\_endpoint](#output\_encryption\_endpoint) | The vault endpoint to encrypt data with key |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Vault Namespace where integration tests will take place |
| <a name="output_token"></a> [token](#output\_token) | Vault Client Token taken from approle |
| <a name="output_url"></a> [url](#output\_url) | Vault address where this module is tested against |
