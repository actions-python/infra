terraform {
  required_version = "~> 1.1"

  required_providers {
    tfe = {
      source  = "registry.terraform.io/hashicorp/tfe"
      version = "~> 0.50.0"
    }
  }
}

resource "tfe_workspace" "default" {
  organization        = var.organization
  name                = var.name
  allow_destroy_plan  = false
  execution_mode      = var.execution_mode
  global_remote_state = var.global_remote_state
  queue_all_runs      = false
  terraform_version   = var.terraform_version
}

resource "tfe_variable" "default" {
  for_each     = { for variable in var.variables : variable.key => variable }
  key          = each.value.key
  value        = each.value.value
  category     = each.value.category
  description  = each.value.description
  hcl          = each.value.hcl
  sensitive    = each.value.sensitive
  workspace_id = tfe_workspace.default.id
}
