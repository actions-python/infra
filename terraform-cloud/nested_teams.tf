resource "tfe_organization_membership" "sudosubin" {
  organization = tfe_organization.actions_python.name
  email        = "sudosubin@gmail.com"
}
