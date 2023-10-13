resource "tfe_organization" "actions_python" {
  name  = "actions-python"
  email = "sudosubin@gmail.com"
}

resource "tfe_organization_token" "actions_python" {
  organization = tfe_organization.actions_python.name
}
