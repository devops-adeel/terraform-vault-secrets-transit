locals {
  application_name = "terraform-modules-development-transit"
  env              = "dev"
  service          = "web"
}

data "vault_auth_backend" "default" {
  path = "approle"
}

module "default" {
  source = "./module"
}

module "vault_approle_encrypt" {
  source            = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.7.0"
  application_name  = "encrypt"
  env               = local.env
  service           = local.service
  mount_accessor    = data.vault_auth_backend.default.accessor
  identity_group_id = module.default.encrypt_identity_group_id
}

module "vault_approle_decrypt" {
  source            = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.7.0"
  application_name  = "decrypt"
  env               = local.env
  service           = local.service
  mount_accessor    = data.vault_auth_backend.default.accessor
  identity_group_id = module.default.decrypt_identity_group_id
}

resource "vault_transit_secret_backend_key" "default" {
  backend          = module.default.backend_path
  name             = format("%s-%s", local.env, local.service)
  deletion_allowed = true
}

resource "vault_approle_auth_backend_login" "default" {
  backend   = module.vault_approle_decrypt.backend_path
  role_id   = module.vault_approle_decrypt.approle_id
  secret_id = module.vault_approle_decrypt.approle_secret
}

data "vault_transit_encrypt" "default" {
  backend   = module.default.backend_path
  key       = vault_transit_secret_backend_key.default.name
  plaintext = "integration_test"
}
