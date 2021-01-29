module "tfconfig-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

policy "allowed-providers" {
  source = "./allowed-providers.sentinel"
  enforcement_level = "mandatory"
}

policy "evaluate-variables-in-nested-modules" {
  source = "./evaluate-variables-in-nested-modules.sentinel"
  enforcement_level = "mandatory"
}

policy "prevent-remote-exec-provisioners-on-null-resources" {
  source = "./prevent-remote-exec-provisioners-on-null-resources.sentinel"
  enforcement_level = "mandatory"
}

policy "require-all-modules-have-version-constraint" {
  source = "./require-all-modules-have-version-constraint.sentinel"
  enforcement_level = "mandatory"
}

policy "validate-variables-have-descriptions" {
  source = "./validate-variables-have-descriptions.sentinel"
  enforcement_level = "mandatory"
}
