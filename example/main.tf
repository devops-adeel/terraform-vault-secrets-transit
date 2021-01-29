#####
#####With the exception of the transit-key itself, mounting transit-secrets and it's auth association would be applied once per namespace.  Most to apply this along with a creation of a namespace.
#####

locals {
  application_name = "terraform-modules-development-transit"
  env              = "dev"
  service          = "web"
}

module "default" {
  source             = "./module"
  encrypt_entity_ids = [module.vault_approle.entity_id]
  decrypt_entity_ids = [module.vault_approle.entity_id]
}

data "vault_auth_backend" "default" {
  path = "approle"
}

module "vault_approle" {
  source           = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.6.1"
  application_name = local.application_name
  env              = local.env
  service          = local.service
  mount_accessor   = data.vault_auth_backend.default.accessor
}

resource "vault_transit_secret_backend_key" "default" {
  backend          = module.default.backend_path
  name             = format("%s-%s", local.env, local.service)
  deletion_allowed = true
}




#####
#####This would be on an application-developer's workspace
#####

resource "vault_approle_auth_backend_login" "default" {
  backend   = module.vault_approle.backend_path
  role_id   = module.vault_approle.approle_id
  secret_id = module.vault_approle.approle_secret
}

provider "vault" {
  alias     = "default"
  namespace = "admin/terraform-vault-secrets-transit"
  token     = vault_approle_auth_backend_login.default.client_token
}

data "vault_transit_encrypt" "default" {
  provider  = vault.default
  backend   = module.default.backend_path
  key       = vault_transit_secret_backend_key.default.name
  plaintext = "devops-adeel"
}

data "vault_transit_decrypt" "default" {
  provider   = vault.default
  backend    = module.default.backend_path
  key        = vault_transit_secret_backend_key.default.name
  ciphertext = data.vault_transit_encrypt.default.ciphertext
}
